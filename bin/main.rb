require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/interface.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/page.rb'
require_relative '../lib/output.rb'
require_relative '../lib/url.rb'

# create a user interface
user_interface = Interface.new('')
puts user_interface.welcome_msg
puts user_interface.authentify_msg
user_interface.name = gets.chomp

# Enter a key word for reserch
puts user_interface.enter_key_words_msg
search_key = gets.chomp
sleep 1

# creat a url and new page
my_url = Url.new(search_key)
web_page = Page.new(my_url.requested_url)

while web_page.read_html.css('div.jobsearch-SerpJobCard').empty?
  puts user_interface.no_result_found_msg
  my_url.key_request = gets.chomp
  web_page.url = my_url.requested_url
end

# create a page and scrapper
my_scraper = Scraper.new(web_page)
count = my_scraper.jobs_list.count

puts user_interface.chose_option_msg
my_option = gets.chomp.to_i

until [1, 2, 3].any?(my_option)
  puts user_interface.after_option_msg(my_option)
  puts user_interface.chose_option_msg
  my_option = gets.chomp.to_i
end

puts user_interface.after_option_msg(my_option)
sleep 3
if my_option == 1
  i = 0
  while i < count
    puts my_scraper.display_it(i)
    i += 1
  end
elsif my_option == 2
  my_scraper.make_csv
elsif my_option == 3
  my_scraper.make_txt
end
