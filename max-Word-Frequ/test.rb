def word_counter(string)
  @wordCount = string.split(/\s+/)
		        .group_by{|x|x}
		        .map{|x,y|[x,y.size]} 
		        .sort_by{|_,size| size} # Have to sort =/
		        .max()
   
  puts "wordCount #{@wordCount} max #{@maxs}"
end

word_counter('ssss ssss ksdjfh aaa aaa')



def world_frequency1(content)
	world_frequency = Hash.new(0)
	        
	content.split.each do |word| 
	      world_frequency[word] += 1
	end
    puts "wordCount #{@world_frequency} max #{@maxs}"

end 

#world_frequency1('ssss ssss ksdjfh aaa aaa')