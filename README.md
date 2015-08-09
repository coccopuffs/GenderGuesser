# GenderGuesser

Here's an R package for using the [genderize.io](https://genderize.io/) API to guess the gender of a name. There's already a really good [genderizeR](https://github.com/kalimu/genderizeR) package out there, but it was missing the features I wanted. 

To use it, call `guessGender` with a character vector of (first) names. You can optionally pass (one of) a language code or country code to fine-tine results. If you've paid for an API key through [genderize.io](https://genderize.io/), you can pass that too.
