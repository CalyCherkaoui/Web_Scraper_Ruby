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
#############################################
###                                       ###
###      Scraping Job offers data         ###
###      from Indeed.com web page         ###
###                                       ###
###                                       ###
#############################################
"
  end

  def chose_option_msg
    "
 ---------------------------------------
|  Chose an option for scrapping:       |
|         Display on terminal, enter 1  |
|         Download CSV file, enter 2    |
|         Download txt file, enter 3    |
|         Download JSON file, enter 4   |
 ---------------------------------------
    "
  end
end
