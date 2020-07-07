require 'csv'
class Output
  attr_accessor :jobs_list
  def initialize (scraper)
    @jobs_list = scraper.jobs_listing
  end

  def make_cvs
    filepath = "test.csv"
    csv_option = {headers: :first_row, col_sep: ','}
    CSV.open(filepath, 'wb', csv_option) do |csv|
      csv << ['title']
      @jobs_list.each do |elem|
        csv << [elem]
      end
    end
  end

  def make_JSON
  
  end

  def make_txt
    filepath = "test.txt"
    txt_file = File.open(filepath, 'w')
    txt_file.write(@jobs_list)
    txt_file.close()
  
  end

  def display_it
  
  end
end