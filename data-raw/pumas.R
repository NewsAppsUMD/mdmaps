## md_pumas_{2010,2020}_sf: Maryland Public Use Microdata Areas
##
## 2010-vintage PUMAs applied through ACS 2021 (tigris year <= 2021).
## 2020-vintage PUMAs applied from ACS 2022 onward.

source(here::here("data-raw", "_shared.R"))

# Helper — normalize column names across the 2010 (suffix "10") and
# 2020 (suffix "20") vintages so both objects have the same schema.
build_md_pumas <- function(tigris_year, vintage) {
  sfx <- switch(as.character(vintage), "2010" = "10", "2020" = "20")

  tigris::pumas(state = "MD", year = tigris_year, cb = FALSE) |>
    janitor::clean_names() |>
    dplyr::transmute(
      geoid = .data[[paste0("geoid", sfx)]],
      state_fips = .data[[paste0("statefp", sfx)]],
      puma_code = .data[[paste0("pumace", sfx)]],
      puma_name = .data[[paste0("namelsad", sfx)]],
      land_area = .data[[paste0("aland", sfx)]],
      water_area = .data[[paste0("awater", sfx)]],
      geometry
    ) |>
    dplyr::arrange(geoid) |>
    sf::st_transform(crs = md_crs)
}

md_pumas_2010_sf <- build_md_pumas(tigris_year = 2019, vintage = "2010")
md_pumas_2020_sf <- build_md_pumas(tigris_year = 2022, vintage = "2020")

usethis::use_data(md_pumas_2010_sf, overwrite = TRUE, compress = "xz")
usethis::use_data(md_pumas_2020_sf, overwrite = TRUE, compress = "xz")
