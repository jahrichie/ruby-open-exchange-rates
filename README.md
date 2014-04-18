**See: currency_conversion.rb**

Convert USD to a list of currencies using Open Excha JSON API and httparty (I already had this in my app, so feel free to talk to the API with whatever makes you happy.

#Dependency
https://openexchangerates.org/ 

https://github.com/jnunemaker/httparty


# Convert USD to any currency from API
"$10,000.00" to "€7238.56" 


CurrencyConversion.calc_by_currency("EUR", 10000)

# Return a hash of last caclualted exchange rates against the USD.
CurrencyConversion.show_rates



{"AED"=>3.673524, "AFN"=>56.5269, "ALL"=>101.35641, "AMD"=>417.297, "ANG"=>1.78898, "AOA"=>97.740925, "ARS"=>8.009547"...}


#DISCLAIMER
Exchange rates are provided for informational purposes only, and do not constitute financial advice of any kind. Although every attempt is made to ensure quality, NO guarantees are given whatsoever of accuracy, validity, availability, or fitness for any purpose - please use at your own risk.

"license": "Data sourced from various providers with public-facing APIs; copyright may apply; resale is prohibited; no warranties given of any kind. 
