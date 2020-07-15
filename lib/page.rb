class Page
  attr_accessor :url
  def initialize(url = 'https://www.indeed.com/')
    @url = url
  end

  def read_html
    document = URI.parse(@url).open
    raw_html = document.read
    Nokogiri::HTML(raw_html)
  end
end
