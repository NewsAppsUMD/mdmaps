## State boundary

#' Maryland state boundary
#'
#' Single-polygon state outline for Maryland, including the Chesapeake Bay
#' water area. EPSG:26985, NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_state_sf`
#' A simple feature collection with 1 row and 6 columns:
#' \describe{
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{state_name}{State name ("Maryland")}
#'   \item{state_abbr}{2-letter USPS abbreviation ("MD")}
#'   \item{land_area}{Land area in square meters (ALAND from TIGER)}
#'   \item{water_area}{Water area in square meters (AWATER from TIGER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details State boundary sourced from U.S. Census Bureau TIGER/Line 2024,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_state_sf"
