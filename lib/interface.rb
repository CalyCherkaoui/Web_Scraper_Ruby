class Interface
  attr_accessor :name, :date
  def initilize(name = '', date)
    @name = name
    @date = date
  end

  def authentify_msg
    'Please enter your user name here ===>'
  end

  def welcome_msg
  '
#########################################
###   Welcome to Job web scrapping    ###
#########################################
'
  end

  def chose_options_msg
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


