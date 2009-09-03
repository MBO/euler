#!/usr/bin/env ruby1.9

#***************************************************************************
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
#***************************************************************************

sum = (1..1000).map{|i| i**i }.reduce(:+)
num = sum.remainder(10_000_000_000) # we need 10 digits
result = num.to_s

puts result
