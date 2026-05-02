## ZIP Code Tabulation Areas

#' Maryland ZIP Code Tabulation Areas with 2019 ACS population
#'
#' Polygons of Maryland ZCTAs along with the 2019 ACS 5-year population
#' estimate. ZCTAs approximate USPS ZIP code service areas but are not
#' identical — they are the Census Bureau's areal representation.
#' EPSG:26985, NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_zcta_sf`
#' A simple feature collection with one row per MD ZCTA and 4 columns:
#' \describe{
#'   \item{zcta}{5-digit ZCTA code}
#'   \item{zcta_name}{ZCTA5 name (e.g. "ZCTA5 20742")}
#'   \item{population}{2019 ACS 5-year total population estimate (B01001_001)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced via `tidycensus::get_acs()` with `geography = "zcta"`,
#'   `state = "MD"`, `year = 2019`, then reprojected to EPSG:26985. ZCTAs
#'   that cross the state line are retained as Census delivers them;
#'   population is for the entire ZCTA, not just the portion in Maryland.
#'   Some ZCTAs (e.g. PO-Box-only areas) have zero population.
#' @source US Census Bureau, American Community Survey 5-year estimates.
"md_zcta_sf"
