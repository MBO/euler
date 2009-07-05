#!/usr/bin/env ruby1.9

#******************************************************************************
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
#******************************************************************************

require 'mathn'

sum = Prime.instance.take_while do |p|
  p < 2_000_000
end.inject(:+)
result = sum
puts result
