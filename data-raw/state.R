## md_state_sf: Maryland state boundary

source(here::here("data-raw", "_shared.R"))

md_state_sf <- tigris::states(cb = FALSE, year = 2024) |>
  janitor::clean_names() |>
  dplyr::filter(statefp == "24") |>
  dplyr::transmute(
    state_fips = statefp,
    state_name = name,
    state_abbr = stusps,
    land_area = aland,
    water_area = awater,
    geometry
  ) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_state_sf, overwrite = TRUE, compress = "xz")
