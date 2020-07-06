require_relative 'page.rb'
require 'nokogiri'
require 'byebug'
require 'colorize'
require 'open-uri'

class Scraper
  attr_accessor :page
  def initialize(page)
    @page = Nokogiri::HTML(page.get_html) #parse html
  end

  def get_all_offers
  job_offers = @page.css('div.jobsearch-SerpJobCard')
  job_offers
  end

end
 
pg = Page.new("https://www.indeed.com/jobs?q=developer+remote&l=")
x = Scraper.new(pg)
y = x.get_all_offers
p y.count
