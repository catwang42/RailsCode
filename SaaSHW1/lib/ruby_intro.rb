# When done, submit this entire file to the autograder.

# Part 1
#sum all the elements from an array 
def sum arr
  sum = 0
  arr.each do |num| 
  	sum += num 
  end 
  return sum
end

#sum of the two largest elements in array 
def max_2_sum arr
  max_2_sum = 0 
  max_num = 0
  second_num = 0
  if arr.length == 0 
  	return max_2_sum
  elsif arr.length ==1
  	return arr[0]
  else 
	  second_num = arr.sort[-2]	
	  max_num = arr.sort[-1]
	  max_2_sum = max_num + second_num
	  return max_2_sum
  end 
end

#check if any two elements in an array sum up to n 
def sum_to_n? arr, n
  result = false 
  i=0
  convertHash = Hash.new(0)

   arr.each do |num| 
    convertHash[num] = i 
    i+=1
  end 

  convertHash.each do |k,v|
    if convertHash.has_key?(n-k) && convertHash[n-k] != v  
      result = true 
      break 
    end
  end 
  
  result
  
end

# Part 2
#return a string 
def hello(name)
  var = "Hello, "+name
  return var
end

#check if an string start with consonant, regardless of capital letter 
def starts_with_consonant? s
  s =~ /\A(?=[^aeiou])(?=[a-z])/i
end

# if a string is a binary number and can be divided by 4 
def binary_multiple_of_4? s
  s=~ /^[01]+$/ and s.to_i(2) % 4 ==0
end

# Part 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize (isbn, price)
    raise ArgumentError,'isbn is an empty string' if isbn.empty?
    raise ArgumentError,'price is zero or less than zero' if price <= 0 
    @isbn = isbn
    @price = price
  end

  def price_as_string
     @print_price = '%.2f' % @price
     return "$#{@print_price}"
  end 

end
