#!/usr/bin/env ruby1.9

#****************************************************************************
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91  99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#****************************************************************************

actual_max = 0
(1...1000).to_a.reverse_each do |a|
  (1...1000).to_a.reverse_each do |b|
    num = a * b
    str = (num).to_s
    if num > actual_max
      actual_max = num if str == str.reverse
    end
  end
end

puts actual_max
