class Interface
  attr_accessor :name

  def initialize(name = '')
    @name = name
  end

  def authentify_msg
    'Please enter your user name here ===>'
  end

  def welcome_msg
    "
#################################################################################
###                                                                           ###
###                     Scraping Job offers data                              ###
###                     from Indeed.com web page                              ###
###                                                                           ###
###                                                                           ###
#################################################################################
"
  end

  def chose_option_msg
    "
                   -------------------------------------------
                    Chose an option for scrapping:
                           Display on terminal, enter => 1
                           Download CSV file, enter   => 2
                           Download txt file, enter   => 3
                           Download JSON file, enter  => 4
                   ------------------------------------------
"
  end

  def after_option_msg(option)
    if option == 1
      "#{@name.capitalize} ! The Scraped Job offers will be displayed here in your terminal"
    elsif option == 2
      "#{@name.capitalize}! you can download the CSV exported file in this folder ../Exported_files/"
    elsif opption == 3
      "#{@name.capitalize}! you can download the text exported file in this folder ../Exported_files/"
    else
      'Wrong option try again'
    end
  end
end
