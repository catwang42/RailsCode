

# Part 1

def sum arr
  return 0 if arr.empty?
  arr.reduce(:+) 
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  sum arr.max(2) 
end

def sum_to_n? arr, n
  arr.permutation(2).map do |x|
    return true if n == sum(x)
  end
  false
end


# Part 2


def hello(name)
  "Hello, #{name}"
end


def starts_with_consonant? s
  return false if s[0] !~ /[A-Za-z]/
  (!['a','e','i','o','u'].include? s[0].downcase)
end


def binary_multiple_of_4? s
  !(s !~ /^[01]+$/) and s.to_i(2) % 4 == 0
end

