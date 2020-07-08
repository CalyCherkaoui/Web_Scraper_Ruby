# spec/page_spec.rb
require_relative '../lib/page'
require 'open-uri'

describe Page do
  let(:page_test) { Page.new('https://ma.indeed.com/?r=us')}
  # parsed_doc_expected = URI.parse('https://ma.indeed.com/?r=us').open.read

  describe '#read_html' do
    it 'the method return a parsed html file' do
      expect(page_test.read_html).to output.to_stderr
    end
  end
end
