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

## Census tracts

#' Maryland census tracts (2000 vintage)
#'
#' Decennial 2000 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2000_sf`
#' A simple feature collection with one row per 2000 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code (CTIDFP00)}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502")}
#'   \item{land_area}{Land area in square meters (ALAND00)}
#'   \item{water_area}{Water area in square meters (AWATER00)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2000,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2000_sf"


#' Maryland census tracts (2010 vintage)
#'
#' Decennial 2010 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2010_sf`
#' A simple feature collection with one row per 2010 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502.03")}
#'   \item{land_area}{Land area in square meters (ALAND10)}
#'   \item{water_area}{Water area in square meters (AWATER10)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2010,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2010_sf"


#' Maryland census tracts (2020 vintage)
#'
#' Decennial 2020 census tract boundaries for Maryland. EPSG:26985,
#' NAD83 / Maryland (meters). An sf object.
#'
#' @format ## `md_census_tracts_2020_sf`
#' A simple feature collection with one row per 2020 tract and 8 columns:
#' \describe{
#'   \item{geoid}{11-digit state+county+tract FIPS code}
#'   \item{state_fips}{2-digit state FIPS code ("24")}
#'   \item{county_fips}{5-digit state+county FIPS code}
#'   \item{tract_code}{6-digit tract code within county}
#'   \item{tract_name}{Tract name (e.g. "Census Tract 7502.06")}
#'   \item{land_area}{Land area in square meters (ALAND)}
#'   \item{water_area}{Water area in square meters (AWATER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line for vintage 2020,
#'   filtered to state FIPS 24 and reprojected to EPSG:26985.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_census_tracts_2020_sf"

## Congressional districts

#' Maryland U.S. Congressional district boundaries
#'
#' Boundaries of Maryland's eight U.S. House districts under the map adopted
#' in 2022 (used 2023-2031). EPSG:26985, NAD83 / Maryland (meters). An sf
#' object.
#'
#' @format ## `md_congressional_districts_sf`
#' A simple feature collection with 8 rows and 7 columns:
#' \describe{
#'   \item{geoid}{4-digit STATE+CD FIPS code (e.g. "2401")}
#'   \item{district_num}{District number, 1-8}
#'   \item{district_name}{District name (e.g. "Congressional District 1")}
#'   \item{congress}{Session of Congress the boundaries represent}
#'   \item{land_area}{Land area in square meters (ALAND from TIGER)}
#'   \item{water_area}{Water area in square meters (AWATER from TIGER)}
#'   \item{geometry}{Multipolygon}
#' }
#' @details Sourced from U.S. Census Bureau TIGER/Line 2024 congressional
#'   district file, filtered to state FIPS 24 and reprojected to EPSG:26985.
#'   Maryland's map was redrawn in 2022 following state court litigation
#'   (\emph{Szeliga v. Lamone}); the boundaries here reflect the enacted
#'   post-litigation map.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>
"md_congressional_districts_sf"

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

