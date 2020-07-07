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
  private
  def job(entry)
    job = {
      title: string_filter(entry.css('.title').text),
      location: string_filter(entry.css('.location .accessible-contrast-color-location').text),
      date_publication: string_filter(entry.css('span.date').text),
      company: string_filter(entry.css('.company').text),
      summary: string_filter(entry.css('div.summary').text),
      url: entry.css('a.jobtitle')[0].attributes['href'].value
    }
  end
  def string_filter(my_string)
    if my_string.empty?
      str = 'Data not Availible'
    else
      output = my_string.gsub(/[\n\r\t]/, '')
      output = output.delete_prefix("  ")
      output = output.delete_suffix("new")
      output
    end
  end
  public
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
y = x.job_listing
p y.count
z = y[0][:title]
p z
f =y[0][:company]
p f
g =y[0][:location]
p g
h = y[0][:date_publication]
p h
h = y[0][:summary]
p h
h = y[0][:url]
p h
