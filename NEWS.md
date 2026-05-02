# mdmaps 0.1.0

Initial release. All geometries are projected to EPSG:26985 (NAD83 /
Maryland, meters).

## Statewide sf layers

* `md_state_sf` — state outline
* `md_counties_sf` — 24 county-equivalents (23 counties + Baltimore City)
* `md_sha_districts_sf` — 7 MDOT State Highway Administration districts
* `md_municipalities_sf` — ~157 incorporated municipalities
* `md_school_districts_sf` — 24 LEAs (1:1 with counties)
* `md_congressional_districts_sf` — 8 U.S. House districts (119th Congress)
* `md_legislative_districts_sf` — 47 state legislative districts
* `md_delegate_subdistricts_sf` — 71 House of Delegates electing units
* `md_census_tracts_{2000,2010,2020}_sf` — decennial tracts
* `md_census_blocks_2020_sf` — 2020 census blocks
* `md_pumas_{2010,2020}_sf` — Public Use Microdata Areas
* `md_zcta_sf` — ZCTAs with 2019 ACS population

## Lookup tibbles

* `md_counties` — county / FIPS lookup
* `md_zips` — ZCTA-to-county lookup

## Deferred to future releases

* Election precinct snapshot (no clean public 2022 shapefile available)
* Shoreline (CUSP-derived, simplified)
* Baltimore City sub-county layers (CSAs, council, police districts)
* Per-county council layers for the Big-7 counties
* EMS regions, District Court districts
* 2000/2010 census blocks
