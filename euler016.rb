#!/usr/bin/env ruby1.9

#******************************************************************************
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?
#******************************************************************************

num = 2**1000
str = num.to_s
digits = str.split(//).map { |i| i.to_i }
result = digits.inject(:+)
puts result
