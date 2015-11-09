class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_reader :word, :guesses, :wrong_guesses
  
  @@get_random_word = ''
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses =''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  #guess 
  def guess(guess_word)
       raise ArgumentError, 'Argument is not a string' unless guess_word.is_a?String
       raise ArgumentError, 'Argument is empty' unless !guess_word.empty?
       raise ArgumentError, 'Argument '
       
       if @guesses != guess_word && @wrong_guesses !=guess_word && guess_word != guess_word.upcase
          if @word.include? guess_word
              @guesses = guess_word
          else
            @wrong_guesses = guess_word
          end
       else
         return false
       end
  #end of guess method
  end
  
   #begin
    #guess('')
    #guess_word =~ /\A\d+\Z/
   #rescue ArgumentError
     #puts 'invalid argument'
   #end

#

end
