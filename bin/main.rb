require 'nokogiri'
require 'httparty'
require 'byebug'
require 'colorize'

def scraper
  url = "https://www.careerbeacon.com/en/search"
  unparsed_page = HTTParty.get(url) #raw html
  parsed_page = NOKOGIRI::HTML(unparsed_page) #parse html
  byebug

end

scraper