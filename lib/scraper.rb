require_relative 'output.rb'
class Scraper
  include Output
  attr_accessor :page

  def initialize(page)
    @page = Nokogiri::HTML(page.read_html) # parse html
  end

  private

  def job(entry)
    {
      title: string_filter(entry.css('.title').text),
      location: string_filter(entry.css('span.location').text),
      date_publication: string_filter(entry.css('span.date').text),
      company: string_filter(entry.css('.company').text),
      summary: string_filter(entry.css('div.summary').text),
      url: "https://www.indeed.com#{entry.css('a.jobtitle')[0].attributes['href'].value}"
    }
  end

  def string_filter(my_string)
    if my_string.empty?
      'Data not Availible'
    else
      output = my_string.gsub(/[\n\r\t]/, '')
      output = output.delete_prefix('  ')
      output = output.delete_suffix('new')
      output
    end
  end

  public

  def jobs_list
    jobs = []
    job_offers = @page.css('div.jobsearch-SerpJobCard')
    job_offers.each do |entry|
      job = job(entry)
      jobs << job
    end
    jobs
  end
end
