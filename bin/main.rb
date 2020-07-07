require 'nokogiri'
require 'byebug'
require 'colorize'
require 'open-uri'

def scraper
  url = "https://www.careerbeacon.com/en/search"
  # url = "https://www.indeed.com/jobs?q=developer+remote&l="
  document = open(url)
  raw_html = document.read #raw html
  parsed_html = Nokogiri::HTML(raw_html) #parse html
  # parse all the jobs listed
  jobs_list = parsed_html.css('tr.full_width') #the job enteries in the page
  # parsing jobjs into hashes
  jobs = []
  jobs_list.each do |entry|
    job = {
      title: entry.css('strong').inner_text,
      location: entry.css('span.location').inner_text,
      publication_date: entry.css('div.job_pub_date').inner_text,
      company: entry.css('div.job_company').inner_text
      # url:
    }
    jobs << job
  end

  byebug

end

scraper
