#!/usr/bin/env ruby1.9

#****************************************************************************
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91  99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#****************************************************************************

nums = []
100.upto(999).each do |a|
  a.upto(999).each do |b|
    nums << a * b
  end
end

result = nums.sort.reverse.find do |i|
  i.to_s == i.to_s.reverse
end

puts result
