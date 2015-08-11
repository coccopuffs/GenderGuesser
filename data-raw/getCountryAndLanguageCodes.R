
# Read genderize.io's lists of supported country and language codes -------

queryResult <- httr::GET("https://api.genderize.io/languages",
                         httr::config(ssl_verifypeer = FALSE))
if (httr::status_code(queryResult) == 200) {
  responseFromJSON <- jsonlite::fromJSON(httr::content(queryResult, as="text"))
  genderizeLanguages <- responseFromJSON[["languages"]]
  # Don't know why they return an empty string.
  genderizeLanguages <- genderizeLanguages[nchar(genderizeLanguages) > 0]
} else {
  stop("Couldn't load language list")
}

queryResult <- httr::GET("https://api.genderize.io/countries",
                         httr::config(ssl_verifypeer = FALSE))
if (httr::status_code(queryResult) == 200) {
  responseFromJSON <- jsonlite::fromJSON(httr::content(queryResult, as="text"))
  genderizeCountries <- responseFromJSON[["countries"]]
} else {
  stop("Couldn't load country list")
}


# Save the lists ----------------------------------------------------------

devtools::use_data(genderizeLanguages, genderizeCountries,
                   internal = TRUE, overwrite = TRUE)
