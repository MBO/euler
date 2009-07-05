#!/usr/bin/env ruby1.9

#****************************************************************************
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#****************************************************************************

require "lib"

num = 600_851_475_143

divisors = factorize(num)
result = divisors.map { |k,v| k }.max

puts result
