## Census blocks

#' Maryland census blocks (2020 vintage)
#'
#' Decennial 2020 census block boundaries for Maryland — the finest-grained
#' Census geography. EPSG:26985, NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_blocks_2020_sf`
#' A simple feature collection with one row per 2020 block and 8 columns:
#' \describe{
#'   \item{geoid}{15-digit state+county+tract+block FIPS code (GEOID20)}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{block_code}{4-digit block code within tract}
#'   \item{land_area}{Land area in square meters (ALAND20)}
#'   \item{water_area}{Water area in square meters (AWATER20)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2020,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985. The 2000 and
#'   2010 block vintages are not shipped in v1 — pull them directly via
#'   \code{tigris::blocks(state = "MD", year = 2010)} if needed.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_blocks_2020_sf"
