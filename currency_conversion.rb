class CurrencyConversion
  ######### API CONFIG #########
  # open exchange api key
  # http = free, https = paid
  # allowed 1k lookups/month
  key    = "YOUR KEY GOES HERE, FREE!"
  base   =  "http://openexchangerates.org/api/latest.json"
  base  += "?app_id="+key
  # ex: http://openexchangerates.org/api/latest.json?app_id=KEY

  ######### API RESPONSE #########
  # persist somewhere, not as a constant. 
  # I store the results in redis using a worker that wakes up at night.
  RATES = HTTParty.get(base).symbolize_keys!
  
  
  ######### CURRENCY SIGN META DATA #########
  # These rarely have ever changed, so constant could work.
  # thank you https://developers.google.com/public-data/docs/canonical/currencies_csv
  CURRENCY_META_DATA = {"AED" => "","AFN" => "؋","ALL" => "Lek","AMD" => "","ANG" => "ƒ","AOA" => "","ARS" => "$","AUD" => "$","AWG" => "ƒ","AZN" => "ман","BAM" => "KM","BBD" => "$","BDT" => "","BGN" => "лв","BHD" => "","BIF" => "","BMD" => "$","BND" => "$","BOB BOV" => "$b","BRL" => "R$","BSD" => "$","BWP" => "P","BYR" => "p.","BZD" => "BZ$","CAD" => "$","CDF" => "","CHF" => "CHF","CLP CLF" => "$","CNY" => "¥","COP COU" => "$","CRC" => "₡","CUP CUC" => "₱","CVE" => "","CZK" => "Kč","DJF" => "","DKK" => "kr","DOP" => "RD$","DZD" => "","EEK" => "","EGP" => "£","ERN" => "","ETB" => "","EUR" => "€","FJD" => "$","FKP" => "£","GBP" => "£","GEL" => "","GHS" => "","GIP" => "£","GMD" => "","GNF" => "","GTQ" => "Q","GYD" => "$","HKD" => "$","HNL" => "L","HRK" => "kn","HTG USD" => "","HUF" => "Ft","IDR" => "Rp","ILS" => "₪","INR" => "","INR BTN"  =>  "" ,"IQD" => "","IRR" => "﷼","ISK" => "kr","JMD" => "J$","JOD" => "","JPY" => "¥","KES" => "","KGS" => "лв","KHR" => "៛","KMF" => "","KPW" => "₩","KRW" => "₩","KWD" => "" ,"KYD" => "$","KZT" => "лв","LAK" => "₭","LBP" => "£","LKR" => "₨","LRD" => "$","LTL" => "Lt","LVL" => "Ls", "LYD" => "", "MAD" => "","MDL" => "","MGA" => "","MKD" => "ден","MMK" => "","MNT" => "₮","MOP" => "","MRO" => "","MUR" => "₨","MVR" => "","MWK" => "","MXN MXV" => "$","MYR" => "RM","MZN" => "MT","NGN" => "₦","NIO" => "C$","NOK" => "kr","NPR" => "₨","NZD" => "$","OMR" => "﷼","PAB USD" => "B/.","PEN" => "S/.","PGK" => "","PHP" => "Php","PKR" => "₨","PLN" => "zł","PYG" => "Gs","QAR" => "﷼","RON" => "lei","RSD" => "Дин.","RUB" => "руб", "RWF" => "", "SAR" => "﷼","SBD" => "$","SCR" => "₨","SDG" => "","SEK" => "kr","SGD" => "$","SHP" => "£","SLL" => "","SOS" => "S","SRD" => "$","STD" => "","SVC USD" => "$","SYP" => "£","SZL" => "","THB" => "฿","TJS" => "","TMT" => "","TND" => "","TOP" => "","TRY" => "TL","TTD" => "TT$","TWD" => "NT$","TZS" => "","UAH" => "₴","UGX" => "","USD" => "$","UYU UYI" => "$U","UZS" => "лв","VEF" => "Bs","VND" => "₫","VUV" => "","WST" => "","XAF" => "","XAG" => "","XAU" => "","XBA" => "","XBB" => "","XBC" => "","XBD" => "","XCD" => "$","XDR" => "","XFU" => "","XOF" => "","XPD" => "","XPF" => "","XPT" => "","XTS" => "","YER" => "﷼","ZAR" => "R","ZAR LSL" => "","ZAR NAD" => "","ZMK" => "","ZWL" => ""}
  
  
  ######### CALCULATE AND DISPLAY #########
  # I BROKE THESE UP IN MY CODE
  #########################################

  def self.calc_by_currency(currency_key, current_price)
    _upcased_key    =  currency_key.upcase
    currency_rate   =  RATES[:rates][_upcased_key]
    converted_price =  current_price*currency_rate
    ActionController::Base.helpers.number_to_currency converted_price, 
      unit: CURRENCY_META_DATA[_upcased_key], 
      seperator: ",", 
      delimiter: "" 
  end

def self.current_rates
  puts RATES[:rates]
end 
 
end
