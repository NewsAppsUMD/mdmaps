## md_school_districts_sf: Maryland public school districts (LEAs)
##
## In Maryland, Local Education Agencies are 1:1 with counties — each
## county (plus Baltimore City) operates a single public school district.
## This layer is a renamed view of md_counties_sf with LEA-style naming
## attached, provided for discoverability and to mirror the `nycmaps`
## pattern of shipping school districts as their own object.

source(here::here("data-raw", "_shared.R"))

# md_counties_sf must already be built; pull it from the package data.
load(here::here("data", "md_counties_sf.rda"))

md_school_districts_sf <- md_counties_sf |>
  dplyr::transmute(
    lea_name = dplyr::if_else(
      is_city,
      "Baltimore City Public Schools",
      paste0(short_county_name, " County Public Schools")
    ),
    county_fips = county_fips,
    short_county_name = short_county_name,
    geometry
  ) |>
  dplyr::arrange(county_fips)

usethis::use_data(md_school_districts_sf, overwrite = TRUE, compress = "xz")
