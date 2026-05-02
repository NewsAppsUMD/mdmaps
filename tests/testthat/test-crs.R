test_that("every sf layer is projected to EPSG:26985", {
  for (nm in sf_layer_names()) {
    layer <- get_layer(nm)
    expect_s3_class(layer, "sf")
    expect_equal(
      sf::st_crs(layer)$epsg, 26985L,
      info = paste0(nm, " has CRS ", sf::st_crs(layer)$epsg)
    )
  }
})
