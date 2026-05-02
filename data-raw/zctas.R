## md_zcta_sf: Maryland ZIP Code Tabulation Areas with ACS population

source(here::here("data-raw", "_shared.R"))

# ACS 5-year 2019 is the last vintage where tidycensus's `state` argument
# reliably subsets ZCTAs before pulling national geometry. Newer vintages
# require a national pull + spatial filter and take much longer.
md_zcta_sf <- tidycensus::get_acs(
  geography = "zcta",
  variables = "B01001_001",
  state = "MD",
  year = 2019,
  geometry = TRUE,
  progress_bar = FALSE
) |>
  janitor::clean_names() |>
  dplyr::transmute(
    zcta = geoid,
    zcta_name = name,
    population = estimate,
    geometry
  ) |>
  dplyr::arrange(zcta) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_zcta_sf, overwrite = TRUE, compress = "xz")
