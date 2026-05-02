## PUMAs

#' Maryland Public Use Microdata Areas (2010 vintage)
#'
#' Boundaries of Maryland's 2010-vintage PUMAs. Each PUMA aggregates
#' census tracts to a minimum population of roughly 100,000. The 2010
#' PUMA geography was used for ACS microdata releases through 2021.
#' EPSG:26985, NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_pumas_2010_sf`
#' A simple feature collection with one row per 2010 PUMA and 7 columns:
#' \describe{
#'   \item{geoid}{7-digit STATE+PUMA code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{puma_code}{5-digit PUMA code}
#'   \item{puma_name}{PUMA name (e.g. "Washington County--Hagerstown City PUMA")}
#'   \item{land_area}{Land area in square meters}
#'   \item{water_area}{Water area in square meters}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line 2019 PUMA file
#'   (2010 vintage), filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_pumas_2010_sf"


#' Maryland Public Use Microdata Areas (2020 vintage)
#'
#' Boundaries of Maryland's 2020-vintage PUMAs, used for ACS microdata
#' releases from 2022 onward. EPSG:26985, NAD83 / Maryland (meters).
#' An sf object.
#'
#' @format ## `md_pumas_2020_sf`
#' A simple feature collection with one row per 2020 PUMA and 7 columns:
#' \describe{
#'   \item{geoid}{7-digit STATE+PUMA code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{puma_code}{5-digit PUMA code}
#'   \item{puma_name}{PUMA name (e.g. "Outer Baltimore County PUMA")}
#'   \item{land_area}{Land area in square meters}
#'   \item{water_area}{Water area in square meters}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line 2022 PUMA file
#'   (2020 vintage), filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_pumas_2020_sf"
