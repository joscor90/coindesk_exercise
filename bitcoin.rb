#Se pide obtener los precios y fechas del último periodo y a partir de estos obtener un arreglo de todas las fechas donde el valor ha sido menor a 5000 USD.

#Primero obtenemos la información a partir de la API de coindesk, para esto haré el request en Postman y copiaré el código
require "uri"
require "net/http"
require "openssl"
require "json"

url = URI("https://api.coindesk.com/v1/bpi/historical/close.json")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

data = response.read_body

puts data

=begin

Esto es lo que obtenemos, si analizamos la estructura vemos que es un hash con otros hashes anidados.

{"bpi":{"2020-08-07":11827.265,"2020-08-08":11568.5,"2020-08-09":11666.45,"2020-08-10":12010.28,"2020-08-11":11832.5,"2020-08-12":11342.01,"2020-08-13":11565.095,"2020-08-14":11759.5,"2020-08-16":11908.33,"2020-08-17":11856.5,"2020-08-18":12327.5,"2020-08-19":11918.5,"2020-08-23":11611.5,"2020-09-02":11795.7,"2020-09-03":11302.8875,"2020-09-04":10292.5983,"2020-09-05":10439.5},"disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index. BPI value data returned as USD.","time":{"updated":"Sep 6, 2020 00:03:00 UTC","updatedISO":"2020-09-06T00:03:00+00:00"}}

=end

