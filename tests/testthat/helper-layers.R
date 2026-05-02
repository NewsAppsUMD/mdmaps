## Enumerate all sf objects shipped by the package so tests can iterate
## uniformly rather than repeating themselves per layer.

sf_layer_names <- function() {
  c(
    "md_state_sf",
    "md_counties_sf",
    "md_sha_districts_sf",
    "md_municipalities_sf",
    "md_school_districts_sf",
    "md_congressional_districts_sf",
    "md_legislative_districts_sf",
    "md_delegate_subdistricts_sf",
    "md_census_tracts_2000_sf",
    "md_census_tracts_2010_sf",
    "md_census_tracts_2020_sf",
    "md_census_blocks_2020_sf",
    "md_pumas_2010_sf",
    "md_pumas_2020_sf",
    "md_zcta_sf"
  )
}

get_layer <- function(name) {
  get(name, envir = asNamespace("mdmaps"))
}
