## md_municipalities_sf: Maryland incorporated municipalities
##
## Sourced from MD iMap's "Municipal Boundaries - Detailed" layer, which
## stores one row per annexation action (~1,366 rows). We dissolve by
## municipality name to produce one row per incorporated place and attach
## the primary county via largest-area spatial overlap with md_counties_sf.

source(here::here("data-raw", "_shared.R"))

# md_counties_sf must already be built; load from the package data store
# so this script also runs standalone.
load(here::here("data", "md_counties_sf.rda"))

muni_url <- paste0(
  "https://mdgeodata.md.gov/imap/rest/services/Boundaries/",
  "MD_PoliticalBoundaries/FeatureServer/5/query",
  "?where=1%3D1&outFields=MUN_NAME,JURSCODE&outSR=4326&f=geojson"
)

muni_raw <- sf::st_read(muni_url, quiet = TRUE) |>
  janitor::clean_names() |>
  sf::st_make_valid()

# Dissolve annexation polygons into one polygon per municipality.
# Title-case the name for display (source is ALL CAPS).
muni_dissolved <- muni_raw |>
  dplyr::mutate(
    muni_name = stringr::str_to_title(mun_name)
  ) |>
  dplyr::group_by(muni_name) |>
  dplyr::summarise(geometry = sf::st_union(geometry), .groups = "drop") |>
  sf::st_transform(crs = md_crs)

# Attach primary county by largest-area intersection with md_counties_sf.
md_counties_for_join <- md_counties_sf |>
  dplyr::select(county_fips, county_name)

muni_county <- sf::st_intersection(muni_dissolved, md_counties_for_join) |>
  dplyr::mutate(int_area = as.numeric(sf::st_area(geometry))) |>
  sf::st_drop_geometry() |>
  dplyr::group_by(muni_name) |>
  dplyr::slice_max(int_area, n = 1, with_ties = FALSE) |>
  dplyr::ungroup() |>
  dplyr::select(muni_name, county_fips, county_name)

md_municipalities_sf <- muni_dissolved |>
  dplyr::left_join(muni_county, by = "muni_name") |>
  dplyr::select(muni_name, county_fips, county_name, geometry) |>
  dplyr::arrange(muni_name)

usethis::use_data(md_municipalities_sf, overwrite = TRUE, compress = "xz")
