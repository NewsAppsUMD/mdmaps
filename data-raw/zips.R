## md_zips: Maryland ZCTA → county lookup table
##
## Derived from the Census Bureau's 2020 ZCTA-to-County relationship file
## plus md_zcta_sf (for population). Each row assigns one ZCTA to its
## primary Maryland county by land-area overlap, and reports what fraction
## of the ZCTA's land actually falls within MD (ZCTAs crossing into PA,
## DE, WV, or VA have md_area_share < 1).
##
## Note: this table does not include the USPS "preferred city" / Post
## Office name for each ZIP. That data lives behind USPS PostalPro's
## terms-of-service wall and is not redistributed here. Users who need
## city strings should consult <https://postalpro.usps.com/ZIP_Locale_Detail>.

source(here::here("data-raw", "_shared.R"))

# Load md_zcta_sf to get the set of MD-relevant ZCTAs and population.
load(here::here("data", "md_zcta_sf.rda"))

rel_url <- "https://www2.census.gov/geo/docs/maps-data/data/rel2020/zcta520/tab20_zcta520_county20_natl.txt"

rel <- readr::read_delim(
  rel_url,
  delim = "|",
  show_col_types = FALSE,
  col_types = readr::cols(.default = readr::col_character())
) |>
  janitor::clean_names() |>
  dplyr::filter(!is.na(geoid_zcta5_20), geoid_zcta5_20 != "") |>
  dplyr::mutate(
    arealand_part = as.numeric(arealand_part),
    arealand_zcta5_20 = as.numeric(arealand_zcta5_20),
    state_fips = substr(geoid_county_20, 1, 2)
  ) |>
  dplyr::filter(geoid_zcta5_20 %in% md_zcta_sf$zcta)

# MD-only portion: pick the MD county with the largest overlap for each ZCTA.
md_primary <- rel |>
  dplyr::filter(state_fips == "24") |>
  dplyr::group_by(geoid_zcta5_20) |>
  dplyr::slice_max(arealand_part, n = 1, with_ties = FALSE) |>
  dplyr::ungroup() |>
  dplyr::transmute(
    zcta = geoid_zcta5_20,
    county_fips = geoid_county_20,
    county_name = namelsad_county_20
  )

# md_area_share = (sum of MD land overlap) / (ZCTA land area). Values <1
# mean the ZCTA crosses a state border; 1.0 means fully within MD.
md_share <- rel |>
  dplyr::group_by(geoid_zcta5_20) |>
  dplyr::summarise(
    md_land = sum(arealand_part[state_fips == "24"], na.rm = TRUE),
    total_land = dplyr::first(arealand_zcta5_20),
    .groups = "drop"
  ) |>
  dplyr::transmute(
    zcta = geoid_zcta5_20,
    md_area_share = dplyr::if_else(total_land > 0, md_land / total_land, 0)
  )

# Anchor on every ZCTA in md_zcta_sf so the lookup is 1:1 with the sf layer.
# ZCTAs with no MD-county overlap in the Census rel file (a few tiny border
# cases) get NA county_fips.
md_zips <- sf::st_drop_geometry(md_zcta_sf) |>
  dplyr::select(zcta, population) |>
  dplyr::left_join(md_primary, by = "zcta") |>
  dplyr::left_join(md_share, by = "zcta") |>
  dplyr::mutate(md_area_share = dplyr::coalesce(md_area_share, 0)) |>
  dplyr::left_join(
    md_counties_lookup |>
      dplyr::select(county_fips, short_county_name, long_county_name),
    by = "county_fips"
  ) |>
  dplyr::select(
    zcta,
    county_fips,
    county_name,
    short_county_name,
    long_county_name,
    md_area_share,
    population
  ) |>
  dplyr::arrange(zcta) |>
  tibble::as_tibble()

usethis::use_data(md_zips, overwrite = TRUE, compress = "xz")
