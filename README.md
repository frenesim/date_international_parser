# International Date Parser


#### Purpose:
Extend the date parsing capabilities of Ruby to work with dates which months are different than english.

#### Usage:
```
InternationalDateParser::Date.parse_international("28 de Fevereiro de 2020")
InternationalDateParser::Date.parse_international("28 abr 2020")
InternationalDateParser::Date.parse_international("28 abr")
InternationalDateParser::Date.parse_international("28")
InternationalDateParser::Date.parse_international([[]])

InternationalDateParser::parse_international(['Fevereiro 11']))
InternationalDateParser::parse_international([[11],['Fev']]))
InternationalDateParser::parse_international([['Fev'],['11']]))
InternationalDateParser::parse_international([['Fev'],['01'],[2011]]))

```

#### Notes:
 * This routine works by substituting your local month names (as defined by Date::MONTH_TRANSLATIONS) for the
    international names when they occur in the date_string.
 + As distributed, this code works for French, German, Italian, Portuguese and Spanish.  You must add the month
    names for any additional languages you wish to handle.

## Inspired on a gist
https://github.com/jackrg
