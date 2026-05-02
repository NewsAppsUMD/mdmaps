test_that("every sf layer intersects the Maryland state boundary", {
  state_geom <- sf::st_geometry(md_state_sf)

  for (nm in sf_layer_names()) {
    layer <- get_layer(nm)
    # Use an envelope intersection for cheap-but-sufficient sanity: a
    # layer whose bbox doesn't overlap MD is almost certainly wrong.
    layer_bbox <- sf::st_as_sfc(sf::st_bbox(layer))
    state_bbox <- sf::st_as_sfc(sf::st_bbox(md_state_sf))
    expect_true(
      as.logical(sf::st_intersects(layer_bbox, state_bbox, sparse = FALSE)),
      info = paste0(nm, " bbox does not overlap MD")
    )
  }
})
