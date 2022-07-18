require(httr)
require(jsonlite)
library(tidyverse)
library(rvest)

get_subcollections <- function(){
test <- jsonlite::read_json("https://api.kb.dk/data/rest/api/text?q=&rows=0&facet=on&facetfield=subcollection_ssi",
                            simplifyVector = F)

test$facet_counts$facet_fields$subcollection_ssi %>%
  .[seq(1, length(.), 2)] %>%
  unlist()

# Med mindre ovenstående fejler - ellers returner:
#   c("adl", "gv",  "tfs", "sks")
}
