## School districts

#' Maryland public school districts (LEAs)
#'
#' Boundaries of Maryland's 24 Local Education Agencies (LEAs). In
#' Maryland, LEAs are 1:1 with counties: each of the 23 counties plus
#' Baltimore City operates a single unified public school district. This
#' layer is therefore geometrically identical to \code{\link{md_counties_sf}};
#' it is provided under the school-district name for discoverability and
#' to mirror the convention of dedicated school-district layers in other
#' state mapping packages. EPSG:26985, NAD83 / Maryland (meters). An sf
#' object.
#'
#' @format ## `md_school_districts_sf`
#' A simple feature collection with one row per LEA and 4 columns:
#' \describe{
#'   \item{lea_name}{LEA name (e.g. "Montgomery County Public Schools", "Baltimore City Public Schools")}
#'   \item{county_fips}{5-digit county FIPS code}
#'   \item{short_county_name}{County name without suffix}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Derived from \code{\link{md_counties_sf}}. Private schools,
#'   charter authorizers, and higher-education districts are not represented.
#' @source Derived from U.S. Census Bureau TIGER/Line counties.
"md_school_districts_sf"
