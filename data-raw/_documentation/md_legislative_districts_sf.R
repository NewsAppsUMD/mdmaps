## Legislative districts

#' Maryland Legislative District boundaries
#'
#' Boundaries of Maryland's 47 Legislative Districts (LDs). Each LD elects
#' one State Senator. Delegates are elected from these same LDs, either at
#' large (multi-member districts) or from A/B/C sub-districts — see
#' \code{\link{md_delegate_subdistricts_sf}} for the Delegate-electing
#' geography. EPSG:26985, NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_legislative_districts_sf`
#' A simple feature collection with 47 rows and 6 columns:
#' \describe{
#'   \item{geoid}{5-digit STATEFP+SLDUST FIPS code (e.g. "24001")}
#'   \item{district_num}{LD number, 1-47}
#'   \item{district_name}{District name verbatim from TIGER (e.g. "State Senate District 17")}
#'   \item{land_area}{Land area in square meters (ALAND from TIGER)}
#'   \item{water_area}{Water area in square meters (AWATER from TIGER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line 2024 state legislative
#'   district (upper) file, filtered to state FIPS 24 and reprojected to
#'   EPSG:26985. Reflects the post-2022 redistricting map in effect for the
#'   2023-2031 sessions.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_legislative_districts_sf"


#' Maryland House of Delegates electing districts
#'
#' Boundaries of the units from which Maryland Delegates are actually
#' elected. For some Legislative Districts, all three Delegates run at-large
#' from the whole LD (one row here, no subdistrict letter). For others the
#' LD is split into A/B/C sub-districts, each electing its own Delegate(s)
#' (multiple rows, one per subdistrict). EPSG:26985, NAD83 / Maryland
#' (meters). An sf object.
#'
#' @format ## `md_delegate_subdistricts_sf`
#' A simple feature collection with 71 rows and 8 columns:
#' \describe{
#'   \item{geoid}{STATEFP+SLDLST code (e.g. "24017", "2429A")}
#'   \item{district_num}{Parent Legislative District number, 1-47}
#'   \item{subdistrict}{"A", "B", or "C" for split LDs, NA for whole-LD multi-member districts}
#'   \item{district_label}{Compact label (e.g. "1", "1A", "27C")}
#'   \item{is_subdistrict}{TRUE if this row is a sub-district, FALSE for whole-LD rows}
#'   \item{district_name}{District name verbatim from TIGER}
#'   \item{land_area}{Land area in square meters (ALAND from TIGER)}
#'   \item{water_area}{Water area in square meters (AWATER from TIGER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line 2024 state legislative
#'   district (lower) file, filtered to state FIPS 24 and reprojected to
#'   EPSG:26985. Reflects the post-2022 redistricting map.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_delegate_subdistricts_sf"
