# spec/page_spec.rb
require_relative '../lib/page'
require 'open-uri'
require 'nokogiri'

describe Page do
  let(:page_test) { Page.new('https://ma.indeed.com/?r=us') }

  describe '#read_html' do
    it 'the method return a string of a parsed Html' do
      expect(page_test.read_html).to be_a_kind_of(Nokogiri::HTML::Document)
    end
  end
end
