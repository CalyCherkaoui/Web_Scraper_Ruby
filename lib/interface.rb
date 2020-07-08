class Interface
  attr_accessor :name

  def initialize(name = '')
    @name = name.capitalize
  end

  def authentify_msg
    'Please enter your user name here ===>'
  end

  def welcome_msg
    '
#################################################################################################
###                                                                                           ###
###                             Scraping Job offers data                                      ###
###                             from Indeed.com web page                                      ###
###                                                                                           ###
###                                                                                           ###
#################################################################################################
'
  end

  def enter_key_words_msg
    "
------------------------------------------------------------------------------------------------
        Hi #{@name}! This scraper allow you to serch job offers by key words.

              Please enter here a key word  for your job search ==>
------------------------------------------------------------------------------------------------
"
  end

  def no_result_found_msg
    "Sorry #{@name} !No result found with these key words. Try again with new Key words "
  end

  def chose_option_msg
    "
------------------------------------------------------------------------------------------------
    Hi #{@name}! Please Chose an option for Displaying or Exporting your scrapping results:
                           Display on terminal, enter => 1
                           Download CSV file, enter   => 2
                           Download txt file, enter   => 3
------------------------------------------------------------------------------------------------
"
  end

  def after_option_msg(option)
    if option == 1
      "#{@name.capitalize} ! The Scraped Job offers will be displayed here in your terminal"
    elsif option == 2
      "#{@name.capitalize}! you can download the CSV exported file in the root folder"
    elsif option == 3
      "#{@name.capitalize}! you can download the text exported file in the root folder"
    else
      'Wrong option try again'
    end
  end
end
