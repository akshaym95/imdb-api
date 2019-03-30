class Movie < ApplicationRecord

require "net/http"
require "uri"


def self.find_film(title,year)
url_path = "www.omdbapi.com"
    begin
        uri = URI.parse(url_path)
        http = Net::HTTP.new(uri.host, uri.port)
        req = Net::HTTP::Get    .new(uri.path, {'Content-Type' =>'application/json'})
        req.body = {t: title,y: year}.to_json
        res = http.request(req)
        puts res.body
        puts res.status
        case res
        when Net::HTTPSuccess then return res.body
        when Net::HTTPServerError then return "failed to find"
        when Net::HTTPClientError then return "failed to find"
        end
      rescue => e
       return "failed to search"
      end


end

end
