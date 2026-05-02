## Census tracts

#' Maryland census tracts (2000 vintage)
#'
#' Decennial 2000 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2000_sf`
#' A simple feature collection with one row per 2000 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code (CTIDFP00)}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502")}
#'   \item{land_area}{Land area in square meters (ALAND00)}
#'   \item{water_area}{Water area in square meters (AWATER00)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2000,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2000_sf"


#' Maryland census tracts (2010 vintage)
#'
#' Decennial 2010 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2010_sf`
#' A simple feature collection with one row per 2010 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502.03")}
#'   \item{land_area}{Land area in square meters (ALAND10)}
#'   \item{water_area}{Water area in square meters (AWATER10)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2010,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2010_sf"


#' Maryland census tracts (2020 vintage)
#'
#' Decennial 2020 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2020_sf`
#' A simple feature collection with one row per 2020 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502.06")}
#'   \item{land_area}{Land area in square meters (ALAND)}
#'   \item{water_area}{Water area in square meters (AWATER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2020,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2020_sf"
