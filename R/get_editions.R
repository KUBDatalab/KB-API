

get_editions <- function(){
  jsonlite::read_json("https://api.kb.dk/data/rest/api/editions",
                            simplifyVector = T)
}

