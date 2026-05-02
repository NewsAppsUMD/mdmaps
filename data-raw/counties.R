## md_counties_sf and md_counties: Maryland county boundaries and lookup

source(here::here("data-raw", "_shared.R"))

# Pull counties straight from TIGER/Line via tigris. Cached under the
# tigris cache dir, so subsequent builds are fast.
md_counties_sf <- tigris::counties(state = "MD", cb = FALSE, year = 2024) |>
  janitor::clean_names() |>
  dplyr::transmute(
    county_fips = geoid,
    county_name = namelsad,
    short_county_name = name,
    land_area = aland,
    water_area = awater,
    geometry
  ) |>
  dplyr::left_join(
    md_counties_lookup |> dplyr::select(county_fips, long_county_name, is_city),
    by = "county_fips"
  ) |>
  dplyr::arrange(county_fips) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_counties_sf, overwrite = TRUE, compress = "xz")

md_counties <- md_counties_lookup |>
  dplyr::select(county_fips, county_name, short_county_name, long_county_name, is_city) |>
  dplyr::arrange(county_fips)

usethis::use_data(md_counties, overwrite = TRUE)
