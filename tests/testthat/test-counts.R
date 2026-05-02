## Feature-count sanity checks. Numbers come from authoritative sources
## (Census TIGER 2024, MD SBE, MDOT SHA, MD iMap). Exact counts may shift
## slightly if upstream data is republished — tolerate small drift where
## noted.

test_that("fixed statewide layers have expected feature counts", {
  expect_identical(nrow(md_state_sf), 1L)
  expect_identical(nrow(md_counties_sf), 24L)
  expect_identical(nrow(md_school_districts_sf), 24L)
  expect_identical(nrow(md_sha_districts_sf), 7L)
  expect_identical(nrow(md_congressional_districts_sf), 8L)
  expect_identical(nrow(md_legislative_districts_sf), 47L)
  # 71 units: some whole-LDs + A/B/C subdistricts. If SBE republishes the
  # SLDL file with a different split, this may drift.
  expect_identical(nrow(md_delegate_subdistricts_sf), 71L)
})

test_that("Census decennial vintages have expected tract/block counts", {
  expect_identical(nrow(md_census_tracts_2000_sf), 1218L)
  expect_identical(nrow(md_census_tracts_2010_sf), 1406L)
  expect_identical(nrow(md_census_tracts_2020_sf), 1475L)
  expect_identical(nrow(md_census_blocks_2020_sf), 83827L)
})

test_that("PUMAs and ZCTAs have expected counts", {
  expect_identical(nrow(md_pumas_2010_sf), 44L)
  expect_identical(nrow(md_pumas_2020_sf), 48L)
  expect_identical(nrow(md_zcta_sf), 468L)
})

test_that("lookup tibbles are 1:1 with their sf companions", {
  expect_identical(nrow(md_counties), 24L)
  expect_identical(nrow(md_zips), nrow(md_zcta_sf))
})

test_that("municipalities layer is in the expected range", {
  # Source has 162 (name, county) pairs that dissolve to ~157 distinct
  # municipalities. Allow a small window for annexation churn.
  expect_gte(nrow(md_municipalities_sf), 150L)
  expect_lte(nrow(md_municipalities_sf), 170L)
})
