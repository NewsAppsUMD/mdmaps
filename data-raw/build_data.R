## Build data objects

# Remove all .rda files in data/ and regenerate them
fs::dir_ls("data", glob = "*.rda") |> fs::file_delete()

# v1 — statewide only. Additional data scripts get added here as they are
# ported. See plans/ for the full roadmap.
source(here::here("data-raw", "state.R"))
source(here::here("data-raw", "counties.R"))
source(here::here("data-raw", "congressional.R"))
source(here::here("data-raw", "legislative.R"))
source(here::here("data-raw", "census_tracts.R"))
source(here::here("data-raw", "census_blocks.R"))
source(here::here("data-raw", "zctas.R"))
source(here::here("data-raw", "zips.R"))
source(here::here("data-raw", "pumas.R"))
source(here::here("data-raw", "sha_districts.R"))
source(here::here("data-raw", "municipalities.R"))
source(here::here("data-raw", "school_districts.R"))

# Documentation in _documentation isn't generated automatically. If the data
# changes, errors are found, or check() detects inconsistencies the
# documentation should be updated manually.

# Concatenate _documentation/*.R files into R/data.R
doc_files <- fs::dir_ls(
  here::here("data-raw", "_documentation"),
  regexp = "\\.R$"
)

# Read all documentation files
doc_content <- doc_files |>
  purrr::map(readLines) |>
  purrr::map(\(x) c(x, "")) |>
  unlist()

# Write to R/data.R
writeLines(
  doc_content,
  here::here("R", "data.R")
)
