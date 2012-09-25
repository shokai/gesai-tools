#!/usr/bin/env ruby
require 'rubygems'
require 'net/http'
require 'uri'

def check(url, type)
  uri = URI.parse URI.encode url
  res = Net::HTTP.start(uri.host, uri.port).
    request(Net::HTTP::Head.new uri.request_uri)
  res.code.to_i == 200 and (!type or res.content_type =~ /#{type}/)
end

url = ARGV.pop
type = ARGV.shift
exit 1 if !url or url !~ Regexp.new('^https?://.+$')

puts url if check url, type
