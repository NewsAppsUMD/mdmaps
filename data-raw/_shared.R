# Shared code and objects
library(devtools)
library(tidyverse)
library(readxl)
library(here)
library(janitor)

library(sf)
library(tigris)

library(tidycensus)
options(tigris_use_cache = TRUE)

# Target projection for all Maryland sf objects: NAD83 / Maryland (meters).
md_crs <- sf::st_crs("EPSG:26985")

# Maryland counties + Baltimore City. Baltimore City is an independent city
# (FIPS 24510) but behaves as a county-equivalent for every administrative
# and statistical purpose, so it is included here.
md_counties_lookup <- tribble(
  ~long_county_name                          , ~county_name              , ~short_county_name , ~county_fips , ~is_city ,
  "Allegany County, Maryland"                , "Allegany County"         , "Allegany"         , "24001"      , FALSE    ,
  "Anne Arundel County, Maryland"            , "Anne Arundel County"     , "Anne Arundel"     , "24003"      , FALSE    ,
  "Baltimore County, Maryland"               , "Baltimore County"        , "Baltimore"        , "24005"      , FALSE    ,
  "Calvert County, Maryland"                 , "Calvert County"          , "Calvert"          , "24009"      , FALSE    ,
  "Caroline County, Maryland"                , "Caroline County"         , "Caroline"         , "24011"      , FALSE    ,
  "Carroll County, Maryland"                 , "Carroll County"          , "Carroll"          , "24013"      , FALSE    ,
  "Cecil County, Maryland"                   , "Cecil County"            , "Cecil"            , "24015"      , FALSE    ,
  "Charles County, Maryland"                 , "Charles County"          , "Charles"          , "24017"      , FALSE    ,
  "Dorchester County, Maryland"              , "Dorchester County"       , "Dorchester"       , "24019"      , FALSE    ,
  "Frederick County, Maryland"               , "Frederick County"        , "Frederick"        , "24021"      , FALSE    ,
  "Garrett County, Maryland"                 , "Garrett County"          , "Garrett"          , "24023"      , FALSE    ,
  "Harford County, Maryland"                 , "Harford County"          , "Harford"          , "24025"      , FALSE    ,
  "Howard County, Maryland"                  , "Howard County"           , "Howard"           , "24027"      , FALSE    ,
  "Kent County, Maryland"                    , "Kent County"             , "Kent"             , "24029"      , FALSE    ,
  "Montgomery County, Maryland"              , "Montgomery County"       , "Montgomery"       , "24031"      , FALSE    ,
  "Prince George's County, Maryland"         , "Prince George's County"  , "Prince George's"  , "24033"      , FALSE    ,
  "Queen Anne's County, Maryland"            , "Queen Anne's County"     , "Queen Anne's"     , "24035"      , FALSE    ,
  "St. Mary's County, Maryland"              , "St. Mary's County"       , "St. Mary's"       , "24037"      , FALSE    ,
  "Somerset County, Maryland"                , "Somerset County"         , "Somerset"         , "24039"      , FALSE    ,
  "Talbot County, Maryland"                  , "Talbot County"           , "Talbot"           , "24041"      , FALSE    ,
  "Washington County, Maryland"              , "Washington County"       , "Washington"       , "24043"      , FALSE    ,
  "Wicomico County, Maryland"                , "Wicomico County"         , "Wicomico"         , "24045"      , FALSE    ,
  "Worcester County, Maryland"               , "Worcester County"        , "Worcester"        , "24047"      , FALSE    ,
  "Baltimore city, Maryland"                 , "Baltimore city"          , "Baltimore"        , "24510"      , TRUE
)

census_vars <- tribble(
  ~variable    , ~varname            ,
  "B01001_001" , "population"        ,
  "B02001_002" , "white_alone"       ,
  "B02001_003" , "black_alone"       ,
  "B02001_005" , "asian_alone"       ,
  "B02001_008" , "two_or_more_races" ,
  "B03003_001" , "hispanic"          ,
  "B03002_003" , "nonhispanic_white" ,
  "B03002_004" , "nonhispanic_black" ,
  "B19013_001" , "med_hhinc"
)
