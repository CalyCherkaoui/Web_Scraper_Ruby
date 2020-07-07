# spec/page_spec.rb
require_relative '../lib/page'
require 'open-uri'

describe Page do
  let(:page_test) { Page.new('https://www.google.com/')}
  parsed_doc_expected = URI.parse(@url).open

  describe '#read_html' do
    it 'the method return a parsed html file' do
      expect(page_test.read_html).to eql(parsed_doc_expected.read)
    end
  end
end
