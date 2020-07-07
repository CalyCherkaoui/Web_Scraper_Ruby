require 'nokogiri'
require 'byebug'
require 'colorize'
require 'open-uri'
require 'csv'
require_relative '../lib/interface.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/page.rb'
require_relative '../lib/output.rb'

# create a user interface
user_interface = Interface.new('')
puts user_interface.welcome_msg
puts user_interface.authentify_msg
user_interface.name = gets.chomp

# chose a scraping option
puts user_interface.chose_option_msg
option = gets.chomp.to_i

# create a page and scrapper
web_page = Page.new('https://www.indeed.com/jobs?q=developer+remote&l=')
my_scraper = Scraper.new(web_page)
count = my_scraper.jobs_list.count
sleep 0.3
puts user_interface.after_option_msg(option)
sleep 3
if option == 1
  i = 0
  while i < count
    puts my_scraper.display_it(i)
    i += 1
  end
elsif option == 2
  my_scraper.make_csv
elsif option == 3
  my_scraper.make_txt
end
