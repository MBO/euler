#!/usr/bin/env ruby1.9

#******************************************************************************
# n! means n x (n - 1) x ... x 3 x 2 x 1
#
# Find the sum of the digits in the number 100!
#******************************************************************************

def fact(n)
  1.upto(n).inject(:*)
end

str = fact(100).to_s
digits = str.split(//).map { |i| i.to_i }
result = digits.inject(:+)
puts result
