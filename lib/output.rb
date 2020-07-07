require 'csv'
module Output

  def make_cvs
    filepath = "job_offers.csv"
    csv_option = {headers: :first_row, col_sep: ','}
    CSV.open(filepath, 'wb', csv_option) do |csv|
      csv << ['title']
      self.jobs_list.each do |elem|
        csv << [elem]
      end
    end
  end

  def make_JSON
  
  end

  def make_txt
    filepath = "test.txt"
    txt_file = File.open(filepath, 'w')
    header = '
******************************************************

    Scraped Job offers from indeed.com web page

******************************************************
'
    txt_file.write(header)
    i = 0
    while i <= self.jobs_list.size
      txt_file.write(display_it(i))
      i += 1
    end
    txt_file.close()
  end

  def display_it(index)
  "
--------------------------------------------------------
        #{self.jobs_list[index][:title]}
--------------------------------------------------------
Location            : #{self.jobs_list[index][:location]}
Date of publication : #{self.jobs_list[index][:date_publication]}
Link to the offer   : #{self.jobs_list[index][:url]}

Summary:
  #{self.jobs_list[index][:Summary]}

-------------------------------------------------------

"
  end

end