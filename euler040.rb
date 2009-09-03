#!/usr/bin/env ruby1.9

#***************************************************************************
# An irrational decimal fraction is created by concatenating the positive
# integers:
#
#   0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1
#
# If dn represents the nth digit of the fractional part, find the value of
# the following expression.
#
#   d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
#***************************************************************************



str = (0..1000000).to_a.join

result = [1,10,100,1_000,10_000,100_000,1_000_000].map do |i|
  str[i].to_i
end.reduce(:*)

puts result
