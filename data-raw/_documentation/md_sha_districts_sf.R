## MDOT SHA districts

#' Maryland State Highway Administration districts
#'
#' Boundaries of the 7 engineering/maintenance districts used by the
#' Maryland Department of Transportation State Highway Administration
#' (MDOT SHA) for project management, maintenance operations, and CHART
#' incident response. Each district groups several counties; together
#' they cover all 23 counties plus Baltimore City. EPSG:26985, NAD83 /
#' Maryland (meters). An sf object.
#'
#' @format ## `md_sha_districts_sf`
#' A simple feature collection with one row per SHA district and 4 columns:
#' \describe{
#'   \item{district_num}{Integer district number (1-7)}
#'   \item{district_name}{District label (e.g. "District 1")}
#'   \item{counties}{Comma-separated list of counties in the district}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from the MDOT SHA ArcGIS FeatureServer
#'   (\code{MDOT_SHA_District_Boundaries}) and reprojected to EPSG:26985.
#'   District attributes (office address, phone, website) are intentionally
#'   omitted because they drift over time — consult
#'   \url{https://www.roads.maryland.gov/} for current contact information.
#' @source <https://data-maryland.opendata.arcgis.com/>
"md_sha_districts_sf"
