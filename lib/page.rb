class Page
  attr_accessor :url
  def initialize(url)
    @url = url
  end

  def read_html
    document = URI.parse(@url).open
    @raw_html = document.read # raw html
    @raw_html
  end
end
