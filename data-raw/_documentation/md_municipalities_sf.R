## Municipalities

#' Maryland incorporated municipalities
#'
#' Boundaries of Maryland's ~157 incorporated municipalities (towns,
#' cities, and villages). EPSG:26985, NAD83 / Maryland (meters). An sf
#' object.
#'
#' Maryland is not a "strong municipality" state: large swaths of the
#' state — including most suburban areas — are unincorporated and
#' governed directly by county government. This layer is therefore
#' \emph{sparse}: it does not tile the state.
#'
#' @format ## `md_municipalities_sf`
#' A simple feature collection with one row per municipality and 4 columns:
#' \describe{
#'   \item{muni_name}{Title-cased municipality name (e.g. "Takoma Park")}
#'   \item{county_fips}{5-digit FIPS of the primary county (largest land-area overlap)}
#'   \item{county_name}{Primary county name with suffix (e.g. "Montgomery County")}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from the Maryland Department of Planning "Municipal
#'   Boundaries - Detailed" layer on MD iMap, which stores one row per
#'   annexation action. Rows are dissolved by municipality name to yield
#'   one polygon per incorporated place. County assignment is the county
#'   with the largest spatial overlap — a handful of municipalities
#'   (e.g. Takoma Park, Hampstead, Sykesville) cross county lines but are
#'   represented here as a single feature attributed to their primary county.
#'   Baltimore City is both a municipality and a county-equivalent; it
#'   appears in this layer and in \code{\link{md_counties_sf}}.
#' @source <https://data-maryland.opendata.arcgis.com/>
"md_municipalities_sf"
