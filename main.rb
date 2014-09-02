#!/usr/bin/env ruby
#http://data.tmsapi.com/v1/movies/showings?startDate=2014-08-20&zip=78701&api_key=qt2jpk5q5m53rz7gb2wup6du


require 'net/http'
require 'fileutils'
require 'date'

today=Date.today.to_s
file=open('.keyfile', 'r')
apikey=file.read
file.close
zipcode="55408"

url='http://data.tmsapi.com/v1/movies/showings?startDate='+today+'&zip='+zipcode+'&api_key='+apikey
resp=Net::HTTP.get_response(URI.parse(url)) #get response as URI
data=resp.body

file=open('dump', 'w')
file.write(data)
file.close
