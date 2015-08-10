# GenderGuesser

Here's an R package for using the [genderize.io](https://genderize.io/) API to guess the gender of a name. There's already a really good [genderizeR](https://github.com/kalimu/genderizeR) package out there, but it was missing the features I wanted. 

To use it, call `guessGender` with a character vector of (first) names. You can optionally pass (one of) a language code or country code to fine-tine results. If you've paid for an API key through [genderize.io](https://genderize.io/), you can pass that too.

## Example

Use the devtools package to install GenderGuesser

```
> library("devtools")
> install_github("eamoncaddigan/GenderGuesser")
```

Calling `guessGender` with one or more names returns a data.frame.

```
> library("GenderGuesser")
> guessGender(c("Liam", "Natalie", "Eamon"))
     name gender country_id language_id probability count
1    Liam   male         NA          NA        0.99   623
2 Natalie female         NA          NA        1.00  2033
3   Eamon   male         NA          NA        1.00    63
```

I have an uncommon name. :)
