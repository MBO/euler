#!/usr/bin/env ruby

#***************************************************************************
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder.
#
# What is the smallest number that is evenly divisible by all of the numbers
# from 1 to 20?
#***************************************************************************

require "lib"

max = 20

divisors = []
2.upto(max).each do |i|
  divisors[i] = factorize(i)
end

max_divisors = Hash.new(0)
divisors.each do |divs|
  next unless divs
  divs.each do |k,v|
    max_divisors[k] = [max_divisors[k],v].max
  end
end

result = max_divisors.map do |k,v|
  k**v
end.inject(:*)
puts result
