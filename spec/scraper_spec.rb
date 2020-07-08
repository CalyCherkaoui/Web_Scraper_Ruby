# spec/scraper_spec.rb

require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/page'
require_relative '../lib/scraper'

describe Scraper do
  let(:page_test) { Page.new('https://www.indeed.com/jobs?q=developer+remote&l=') }
  let(:scraper_test) { Scraper.new(page_test) }
  describe '#initialize' do
    it 'returns an argument error when no argument is given' do
      expect { Scraper.new }.to raise_error(ArgumentError)
    end
  end

  describe '#string_filter' do
    let(:string_test) { "  test\n\rnew" }
    it 'Private method that filter a string from no alphabetic character and suffix new' do
      expect(scraper_test.send(:string_filter, string_test)).to eq('test')
    end
  end

  describe '#job' do
    it 'Private method taht returns an hash with keys includint title' do
      my_test = scraper_test.send(:job, scraper_test.page)
      expect(my_test).to include(:title)
    end
  end

  describe '#jobs_list' do
    it 'returns an array of hashes' do
      expect(scraper_test.jobs_list).to be_a_kind_of(Array)
    end
  end

  describe '#Output::make_csv' do
    it 'returns a array of hashes' do
      expect(scraper_test.make_csv).to be_a_kind_of(Array)
    end
  end
  describe '#Output::make_txt' do
    it 'returns nil' do
      expect(scraper_test.make_txt).to be_nil
    end
  end
  describe '#Output::display_it' do
    it 'returns a string' do
      expect(scraper_test.display_it(0)).to be_a_kind_of(String)
    end
  end
end
