require 'nokogiri'
require 'byebug'
require 'colorize'
require 'open-uri'

class Page
  attr_accessor :url
  def initialize(url)
    @url = url
  end
  #private
  def get_html
    document = open(@url)
    @raw_html = document.read #raw html
    @raw_html
  end
  public
  def parse_html
    @parsed_html = Nokogiri::HTML(get_html) #parse html
  end
end

pg = Page.new("https://www.careerbeacon.com/en/search")
x = pg.parse_html
p x
