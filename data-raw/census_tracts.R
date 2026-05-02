## md_census_tracts_{2000,2010,2020}_sf: Maryland census tract boundaries

source(here::here("data-raw", "_shared.R"))

# TIGER tract column names carry a year suffix for the 2000 and 2010
# vintages (STATEFP00, GEOID10 etc.) and are unsuffixed in 2020. 2000 also
# uses CTIDFP00 rather than GEOID00 for the primary key. Normalize across
# years so each object has the same column schema.
build_md_tracts <- function(year) {
  sfx <- switch(
    as.character(year),
    "2000" = "00",
    "2010" = "10",
    "2020" = ""
  )
  geoid_col <- if (year == 2000) paste0("ctidfp", sfx) else paste0("geoid", sfx)

  tigris::tracts(state = "MD", year = year, cb = FALSE) |>
    janitor::clean_names() |>
    dplyr::transmute(
      geoid = .data[[geoid_col]],
      state_fips = .data[[paste0("statefp", sfx)]],
      county_fips = paste0(state_fips, .data[[paste0("countyfp", sfx)]]),
      tract_code = .data[[paste0("tractce", sfx)]],
      tract_name = .data[[paste0("namelsad", sfx)]],
      land_area = .data[[paste0("aland", sfx)]],
      water_area = .data[[paste0("awater", sfx)]],
      geometry
    ) |>
    dplyr::arrange(geoid) |>
    sf::st_transform(crs = md_crs)
}

md_census_tracts_2000_sf <- build_md_tracts(2000)
md_census_tracts_2010_sf <- build_md_tracts(2010)
md_census_tracts_2020_sf <- build_md_tracts(2020)

usethis::use_data(md_census_tracts_2000_sf, overwrite = TRUE, compress = "xz")
usethis::use_data(md_census_tracts_2010_sf, overwrite = TRUE, compress = "xz")
usethis::use_data(md_census_tracts_2020_sf, overwrite = TRUE, compress = "xz")
