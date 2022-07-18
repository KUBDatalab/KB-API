require(rvest)
require(purrr)
require(magrittr)

base_url <- "https://api.kb.dk/data/"

rvest::read_html(base_url) %>%
  rvest::html_elements("body .main-nav a") %>%
  purrr::map_dfr(~data.frame(
    "navn" = rvest::html_attr(., "href"),
    "beskrivelse" = rvest::html_text(.)
  )) %>%
  mutate(link = paste0(base_url, navn))

# Hvis ovenstående fejler - returner denne:
# navn         beskrivelse                        link
# 1 dsfl  Aerial photographs https://api.kb.dk/data/dsfl
# 2  cop Digital collections  https://api.kb.dk/data/cop
# 3 text    Text collections https://api.kb.dk/data/text
