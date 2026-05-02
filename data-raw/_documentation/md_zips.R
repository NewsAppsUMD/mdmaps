## ZIP lookup table

#' Maryland ZCTA-to-county lookup table
#'
#' Lookup table assigning each Maryland-relevant ZCTA to its primary
#' Maryland county, with 2019 ACS population and a flag for cross-border
#' ZCTAs. Companion tibble to \code{\link{md_zcta_sf}}.
#'
#' @format ## `md_zips`
#' A tibble with one row per MD-relevant ZCTA and 7 columns:
#' \describe{
#'   \item{zcta}{5-digit ZCTA code}
#'   \item{county_fips}{5-digit FIPS code of the ZCTA's primary MD county (by land-area overlap)}
#'   \item{county_name}{County name with suffix (e.g. "Montgomery County")}
#'   \item{short_county_name}{County name without suffix (e.g. "Montgomery")}
#'   \item{long_county_name}{County name with ", Maryland" suffix}
#'   \item{md_area_share}{Fraction of the ZCTA's land area that falls within Maryland (1.0 means fully within MD; <1 means the ZCTA crosses into PA, DE, WV, or VA)}
#'   \item{population}{2019 ACS 5-year total population (for the entire ZCTA, not just the MD portion)}
#' }
#' @details County assignment derived from the U.S. Census Bureau's 2020
#'   ZCTA-to-County relationship file
#'   (\code{tab20_zcta520_county20_natl.txt}); population joined from
#'   \code{\link{md_zcta_sf}}. ZCTAs that span multiple MD counties are
#'   assigned to the MD county with the largest land-area overlap.
#'   A small number of border ZCTAs appear in \code{md_zcta_sf} but have
#'   no MD county row in the Census relationship file — these are
#'   retained here with \code{county_fips = NA} and \code{md_area_share = 0}
#'   to keep the table 1:1 with \code{md_zcta_sf}.
#'   This table does not carry the USPS "preferred city" string; for that
#'   consult USPS PostalPro directly.
#' @source <https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.html>;
#'   population from US Census Bureau, American Community Survey 5-year estimates (2019).
"md_zips"
