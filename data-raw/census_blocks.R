## md_census_blocks_2020_sf: Maryland 2020 census blocks
##
## Only the 2020 vintage ships in v1. ~84k features, ~49 MB xz-compressed.
## 2000 and 2010 vintages are deferred to a later release.

source(here::here("data-raw", "_shared.R"))

md_census_blocks_2020_sf <- tigris::blocks(state = "MD", year = 2020) |>
  janitor::clean_names() |>
  dplyr::transmute(
    geoid = geoid20,
    state_fips = statefp20,
    county_fips = paste0(statefp20, countyfp20),
    tract_code = tractce20,
    block_code = blockce20,
    land_area = as.numeric(aland20),
    water_area = as.numeric(awater20),
    geometry
  ) |>
  dplyr::arrange(geoid) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_census_blocks_2020_sf, overwrite = TRUE, compress = "xz")
