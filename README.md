**See: currency_conversion.rb**
Convert USD to a list of currencies using Open Excha JSON API and httparty (I already had this in my app, so feel free to talk to the API with whatever makes you happy.

#Dependency
https://openexchangerates.org/ 

https://github.com/jnunemaker/httparty


**Example:**


# Convert USD to any currency from API
"$10,000.00" to "€7238.56" 


CurrencyConversion.calc_by_currency("EUR", 10000)

# Return a hash of last caclualted exchange rates against the USD.
CurrencyConversion.show_rates



