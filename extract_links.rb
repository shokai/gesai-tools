#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'

def extract(url, &block)
  doc = Nokogiri::HTML open(url).read
  links = doc.xpath("//a").map{|a|
    a["href"]
  }.uniq.reject{|a|
    a =~ /^javascript/i
  }.map{|a|
    expand_url a, url
  }.reject{|a|
    !a
  }
  if block_given?
    links.each{|a|
      yield a
    }
  end
  links
end

def expand_url(path, source_url)
  return false if !path or !source_url
  path.strip!
  source_url.strip!
  return path if path =~ /^http/
  location = URI.parse source_url
  root = location.port == 80 ? "#{location.scheme}://#{location.host}" : "#{location.scheme}://#{location.host}:#{location.port}"
  return "#{root}#{path}" if path =~ /^\/.*/
  tmp = location.request_uri.split('/')
  tmp.pop
  return "#{root}#{tmp.join('/')}/#{path}"
end

urls = ARGV.empty? ? STDIN.read.split(/[\r\n]+/) : ARGV
urls.each do |url|
  extract url.strip do |i|
    puts i
  end
end
