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
  
  #guess function , change wrong_guesses and guesses according to user's guess
  def guess(guess_word)
       #@guess_word = guess_word
       raise ArgumentError, 'Argument is not a string' unless !guess_word.nil?
       raise ArgumentError, 'Argument is empty' unless !guess_word.empty?
       raise ArgumentError, 'Argument is not a letter' unless guess_word[/[a-zA-Z]+/] == guess_word
       
       
       if @guesses != guess_word && @wrong_guesses !=guess_word && guess_word != guess_word.upcase
          if @word.include? guess_word
              @guesses << guess_word
          else
            @wrong_guesses << guess_word
          end
       else
         return false
       end
  end
  
  #substitutes the correct guesses made so far into the word
  def word_with_guesses
    @display = ''
    @word.each_char do |c|
        if @guesses.include?c 
          @display << c 
        else
          @display << '-'
        end
    end
    return @display
  end
  
  #return the gaming state 
  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose
    elsif  @word == word_with_guesses
      return :win
    else
      return :play
    end
  end

 

#
end
