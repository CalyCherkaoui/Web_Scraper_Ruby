require 'nokogiri'
require 'httparty'
require 'byebug'
require 'colorize'

def scraper
  url = "https://www.careerbeacon.com/en/search"
  unparsed_pg = HTTParty.get(url) #raw html
  parsed_pg = Nokogiri::HTML(unparsed_pg) #parse html
  # parse all the jobs listed
  jobs_list = parsed_pg.css('tr.full_width') #the job enteries in the page
  # parsing jobjs into hashes
  jobs = []
  jobs_list.each do |entry|
    job = {
      title: entry.css('strong').text,
      location: entry.css('span.location').text,
      publication_date: entry.css('div.job_pub_date').text,
      company: entry.css('div.job_company').text
      # url:
    }
    jobs << job
  end

  byebug

end

scraper
