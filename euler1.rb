#!/usr/bin/env ruby


#***************************************************************************
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#***************************************************************************

puts (1...1000).inject(0) { |a,e| ((e % 3 == 0) || (e % 5 == 0)) ? a + e : a }
puts (1...1000).find_all { |e| e % 3 == 0 || e % 5 == 0 }.reduce(:+)
