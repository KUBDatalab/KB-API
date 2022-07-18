


get_genres <- function(){
  base_url <- "https://api.kb.dk/data/text"

  test <- rvest::read_html(base_url)

  res <- test %>%
    html_element("#genre_ssi") %>%
    html_elements("option") %>%
    html_attrs() %>%
    unlist()
  unname(res[nchar(res)>0])
}
