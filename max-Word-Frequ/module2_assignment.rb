#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer

 
    attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number


    def initialize (content,line_number)
       @content = content
       @line_number = line_number
       self.calculate_word_frequency
    end
  
    def calculate_word_frequency()
       
        world_frequency = Hash.new(0)
        
        @content.split.each do |word| 
          world_frequency[word.downcase] += 1
        end
        @highest_wf_count = world_frequency.values.max
        @highest_wf_words = world_frequency.select{|k,v| v == highest_wf_count}.keys

    end

end

#  Implement a class called Solution. 
class Solution

  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
 
  def initialize
    @analyzers = []

  end
  
  def analyze_file()
     @count =0
     File.foreach( 'test.txt' ) do |line|
       @analyzers << LineAnalyzer.new(line,@count)
       @count += 1
    end

  end
   
  def calculate_line_with_highest_frequency()
      @highest_count_words_across_lines=Array.new(0)
      maxCount = 0 
      
       @analyzers.each do |line_read|
          maxCount = line_read.highest_wf_count if line_read.highest_wf_count >= maxCount
       end

        @highest_count_across_lines = maxCount  

       @analyzers.each do |line_read| 
        highest_count_words_across_lines.push(line_read) if line_read.highest_wf_count == maxCount
       end 

     
   # @highest_count_across_lines = 

  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:/n "

  end 



  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
