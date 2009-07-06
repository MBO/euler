#!/usr/bin/env ruby1.9

#******************************************************************************
# The decimal number, 585 = 1001001001_2 (binary), is palindromic in
# both bases.
#
# Find the sum of all numbers, less than one million, which are
# palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not
# include leading zeros.)
#******************************************************************************

def palindrome?(str)
  str == str.reverse
end

nums = 1.upto(1_000_000).find_all do |num|
  palindrome?(num.to_s(10)) && palindrome?(num.to_s(2))
end

result = nums.inject(:+)
puts result
