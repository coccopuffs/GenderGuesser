# GenderGuesser

Here's an R package for using the [genderize.io](https://genderize.io/) API to guess the gender of a name. There's already a really good [genderizeR](https://github.com/kalimu/genderizeR) package out there (and on CRAN), but it was missing enough of the features I wanted that it made more sense to write my own code than fork that project. 

To use it, call `guessGender` with a character vector of (first) names. You can optionally pass (one of) a language code or country code to fine-tine results. If you've paid for an API key through [genderize.io](https://genderize.io/), you can pass that too.

## Example

Use the `devtools` package to install GenderGuesser

```r
library("devtools")
install_github("eamoncaddigan/GenderGuesser")
```

Calling `guessGender` with one or more names returns a `data.frame`. 

```r
library("GenderGuesser")
guessGender(c("Liam", "Natalie", "Eamon"))
#>     name gender country_id language_id probability count
#>1    Liam   male         NA          NA        0.99   623
#>2 Natalie female         NA          NA        1.00  2033
#>3   Eamon   male         NA          NA        1.00    63
```

"Eamon" is an uncommon name, but only boys seem to have it so far. 

## Limits

[genderize.io](https://genderize.io/) limits each IP address to 100 (free) queries per day, and each query can contain up to ten names. `guessGender` does the work of splitting a vector of arbitrary length into ten-name queries and combines the results. However, only one country or language code can be passed to the function, so querying, e.g., a single name in multiple countries must be done using multiple calls to `guessGender`. 
