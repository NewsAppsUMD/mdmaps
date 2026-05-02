## md_congressional_districts_sf: Maryland U.S. House district boundaries

source(here::here("data-raw", "_shared.R"))

# TIGER/Line 2024 reflects the 119th Congress (2025-2027). Maryland's
# current map was adopted in 2022 after redistricting litigation and is
# used through the 2030 cycle.
md_congressional_districts_sf <- tigris::congressional_districts(
  cb = FALSE,
  year = 2024
) |>
  janitor::clean_names() |>
  dplyr::filter(statefp == "24") |>
  dplyr::transmute(
    geoid = geoid,
    district_num = as.integer(substr(geoid, 3, 4)),
    district_name = namelsad,
    congress = as.integer(cdsessn),
    land_area = aland,
    water_area = awater,
    geometry
  ) |>
  dplyr::arrange(district_num) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_congressional_districts_sf, overwrite = TRUE, compress = "xz")
