## County boundaries

#' Maryland county (and Baltimore City) boundaries
#'
#' County-level boundaries for Maryland, including Baltimore City as a
#' county-equivalent (FIPS 24510). EPSG:26985, NAD83 / Maryland (meters).
#' An sf object.
#'
#' @format ## `md_counties_sf`
#' A simple feature collection with 24 rows and 7 columns:
#' \describe{
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{county_name}{County name with suffix (e.g. "Montgomery County", "Baltimore city")}
#'   \item{short_county_name}{County name without suffix (e.g. "Montgomery")}
#'   \item{long_county_name}{County name with ", Maryland" suffix}
#'   \item{land_area}{Land area in square meters (ALAND from TIGER)}
#'   \item{water_area}{Water area in square meters (AWATER from TIGER)}
#'   \item{is_city}{TRUE for Baltimore City, FALSE for all other rows}
#'   \item{geometry}{Multipolygon}
#' }
#' @details County boundaries sourced from U.S. Census Bureau TIGER/Line 2024,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_counties_sf"


#' Maryland county names and FIPS codes
#'
#' Lookup table of Maryland counties and Baltimore City.
#'
#' @format ## `md_counties`
#' A data frame with 24 rows and 5 columns:
#' \describe{
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{county_name}{County name with suffix (e.g. "Montgomery County", "Baltimore city")}
#'   \item{short_county_name}{County name without suffix (e.g. "Montgomery")}
#'   \item{long_county_name}{County name with ", Maryland" suffix}
#'   \item{is_city}{TRUE for Baltimore City, FALSE for all other rows}
#' }
#' @details Baltimore City (FIPS 24510) is an independent city that functions
#'   as a county-equivalent for administrative, statistical, and electoral
#'   purposes. It is included in this table alongside the 23 Maryland counties.
#' @source U.S. Census Bureau FIPS codes.
"md_counties"
