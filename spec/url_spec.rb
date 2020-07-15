# spec/url_spec.rb
require_relative '../lib/url'

describe Url do
  let(:key_test) { 'test' }
  let(:url_test) { Url.new(key_test) }
  describe '#initialize' do
    it 'testing initialize method' do
      expect(url_test.key_request).to eql('test')
    end
  end
  describe '#key_word_filter' do
    it 'private method return a string that substitute any empty space by a +' do
      expect(url_test.send(:key_word_filter, 'test test')).to eq('test+test')
    end
  end
  describe '#requested_url' do
    it 'returns the url with the key words' do
      expect(url_test.requested_url).to eq('https://www.indeed.com/jobs?q=test&l=')
    end
  end
end
