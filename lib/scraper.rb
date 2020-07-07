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

  def job(entry)
    job = {
      title: entry.css().text,
      location: entry.css().text,
      date_publication: entry.css().text,
      company: entry.css().text,
      salary: entry.css().text,
      summary: entry.css().text,
      url: entry.css().text
    }
  end

  def job_listing
    jobs = []
    job_offers = @page.css('div.jobsearch-SerpJobCard')
    job_offers.each do |entry|
      job = job(entry)
      jobs << job
    end
    jobs
  end
    
end
 
pg = Page.new("https://www.indeed.com/jobs?q=developer+remote&l=")
x = Scraper.new(pg)
y = x.all_offers
p y.count
