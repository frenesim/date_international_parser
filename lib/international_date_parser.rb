  # -*- coding: utf-8 -*-
  #
  # Purpose:
  # Extend the date parsing capabilities of Ruby to work with dates with international month names.
  #
  # Usage:
  #
  # Date.parse_international(date_string)
  # DateTime.parse_international(date_string)
  # date_string.to_international_date
  #
  # Notes:
  # 1) This routine works by substituting your local month names (as defined by Date::MONTH_TRANSLATIONS) for the
  #    international names when they occur in the date_string.
  # 2) As distributed, this code works for French, German, Italian, and Spanish.  You must add the month
  #    names for any additional languages you wish to handle.
  #

require 'date'

module InternationalDateParser

  class Date < Date
    MONTH_TO_PARSE = {
      fr: %w(janvier février mars avril mai juin juillet août septembre octobre novembre décembre), # French
      ge: %w(Januar Februar März April Mai Juni Juli August September Oktober November Dezember),  # German
      it: %w(gennaio febbraio marzo aprile maggio giugno luglio agosto settembre ottobre novembre dicembre),  # Italian
      es: %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre), # Spanish
      pt: %w(janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro), # Portuguese
      en: Date::MONTHNAMES[1..12], # English
    }
    MONTH_TRANSLATIONS = MONTH_TO_PARSE.values.flatten
    MONTH_TRANSLATIONS_SHORT = MONTH_TRANSLATIONS.map{|m| m[0,3]}

    def self.parse_international(date)
      return nil if date.nil? || date.empty?
      if date.is_a? Array
        date.push(Date.today.year) if date.flatten.count <= 2
        date = date.join(" ")
      end
      if date.scan(/[a-zA-Z]/).empty?
        Date.parse(date)
      else
        Date.parse(date_to_english(date))
      end
    end

    def self.date_to_english(date)
      month_from = date[/[^\s\d,]{3,}/i].downcase      # Search for a month name
      month_index = MONTH_TRANSLATIONS.index(month_from) || MONTH_TRANSLATIONS_SHORT.index(month_from)
      date.scan(/\s[^\s\d,]{1,2}\s/).each{|s| date.sub!(s[/[^\s]+/],'') if s}
      date.downcase!
      date.sub!(month_from, Date::MONTHNAMES[month_index % 12 + 1]) if month_index
      date
    end
  end

end