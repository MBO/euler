#!/usr/bin/env ruby1.9

#****************************************************************************
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91  99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#****************************************************************************

max = 0
999.downto(100).each do |a|
  a.downto(100).each do |b|
    prod = a * b
    str = (prod).to_s
    max = [max, prod].max if str == str.reverse
  end
end

puts max
