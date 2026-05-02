## md_legislative_districts_sf: Maryland Legislative Districts (47)
## md_delegate_subdistricts_sf: Maryland House of Delegates electing units (71)
##
## Maryland has 47 Legislative Districts. Each LD elects 1 State Senator.
## Delegates are elected from either the whole LD (3 at-large seats) or
## from A/B/C sub-districts. The Census upper-chamber layer (SLDU) gives
## the 47 LDs; the lower-chamber layer (SLDL) gives the Delegate electing
## units, which is a mix of whole LDs (MMDs) and letter-suffixed subs.

source(here::here("data-raw", "_shared.R"))

md_legislative_districts_sf <- tigris::state_legislative_districts(
  state = "MD",
  house = "upper",
  year = 2024
) |>
  janitor::clean_names() |>
  dplyr::transmute(
    geoid = geoid,
    district_num = as.integer(sldust),
    district_name = namelsad,
    land_area = aland,
    water_area = awater,
    geometry
  ) |>
  dplyr::arrange(district_num) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_legislative_districts_sf, overwrite = TRUE, compress = "xz")


md_delegate_subdistricts_sf <- tigris::state_legislative_districts(
  state = "MD",
  house = "lower",
  year = 2024
) |>
  janitor::clean_names() |>
  dplyr::mutate(
    is_subdistrict = grepl("[A-Z]$", sldlst),
    district_num = dplyr::if_else(
      is_subdistrict,
      as.integer(substr(sldlst, 1, 2)),
      as.integer(sldlst)
    ),
    subdistrict = dplyr::if_else(
      is_subdistrict,
      substr(sldlst, 3, 3),
      NA_character_
    ),
    district_label = sub("^0+", "", sldlst)
  ) |>
  dplyr::transmute(
    geoid = geoid,
    district_num,
    subdistrict,
    district_label,
    is_subdistrict,
    district_name = namelsad,
    land_area = aland,
    water_area = awater,
    geometry
  ) |>
  dplyr::arrange(district_num, subdistrict) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_delegate_subdistricts_sf, overwrite = TRUE, compress = "xz")
