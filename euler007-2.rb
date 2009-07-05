#!/usr/bin/env ruby1.9

#*****************************************************************************
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.
#
# What is the 10001st prime number?
#*****************************************************************************

require "lib"

i = 0
result = nil
Primes.new(200_000).each do |prime|
  i += 1
  if i == 10_001
    result = prime
    break
  end
end
puts result
