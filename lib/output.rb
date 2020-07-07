module Output
  def make_csv
    filepath = '../Exported_files/job_offers.csv'
    csv_option = { headers: :first_row, col_sep: ',' }
    CSV.open(filepath, 'wb', csv_option) do |csv|
      csv << ['Title', 'Location', 'Pubication date', 'Link']
      jobs_list.each do |elem|
        csv << [elem[:title], elem[:location], elem[:date_publication], elem[:url]]
      end
    end
  end

  def make_txt
    filepath = '../Exported_files/job_offers.txt'
    txt_file = File.open(filepath, 'w')
    header = '
******************************************************

    Scraped Job offers from indeed.com web page

******************************************************
'
    txt_file.write(header)
    i = 0
    while i < jobs_list.size
      txt_file.write(display_it(i))
      i += 1
    end
    txt_file.close
  end

  def display_it(index)
    "
----------------------------------------------------------------------------------------------------
                      #{jobs_list[index][:title]}
----------------------------------------------------------------------------------------------------
Location            : #{jobs_list[index][:location]}
Date of publication : #{jobs_list[index][:date_publication]}
Link to the offer   : #{jobs_list[index][:url]}

"
  end
end
