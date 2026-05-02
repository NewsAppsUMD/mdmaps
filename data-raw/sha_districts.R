## md_sha_districts_sf: MDOT State Highway Administration engineering districts
##
## 7 districts covering MD's 23 counties + Baltimore City. Used by MDOT SHA
## for maintenance operations, project management, and CHART incident response.
## Sourced from the MDOT SHA ArcGIS FeatureServer.

source(here::here("data-raw", "_shared.R"))

sha_url <- paste0(
  "https://services.arcgis.com/njFNhDsUCentVYJW/arcgis/rest/services/",
  "MDOT_SHA_District_Boundaries/FeatureServer/0/query",
  "?where=1%3D1&outFields=*&outSR=4326&f=geojson"
)

md_sha_districts_sf <- sf::st_read(sha_url, quiet = TRUE) |>
  janitor::clean_names() |>
  dplyr::transmute(
    district_num = as.integer(district_int),
    district_name = district_name,
    counties = district_counties,
    geometry
  ) |>
  dplyr::arrange(district_num) |>
  sf::st_transform(crs = md_crs)

usethis::use_data(md_sha_districts_sf, overwrite = TRUE, compress = "xz")
