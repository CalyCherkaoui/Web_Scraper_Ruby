class Url
  attr_accessor :key_request

  def initialize( key_request = 'developer+remote')
    @key_request = key_request
  end

  def requested_url
    "https://www.indeed.com/jobs?q=#{key_word_filter(@key_request)}&l="
  end

  private
  def key_word_filter(key)
    key.downcase!
    key = key.sub(' ', '+')
  end

end

# u = Url.new('Ruby')
# p u.requested_url
