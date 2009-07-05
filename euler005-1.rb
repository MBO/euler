#!/usr/bin/env ruby

#***************************************************************************
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder.
#
# What is the smallest number that is evenly divisible by all of the numbers
# from 1 to 20?
#***************************************************************************

def primes(num)
  sqrt = Math.sqrt(num).floor
  array = Array.new(num,0)
  (2..sqrt).each do |i|
    while num % i == 0
      num /= i
      array[i-1] += 1
    end
  end
  array[1-1] = 1
  array[num-1] = 1
  array
end

max = 20
result = (2..max).inject(Array.new(max,0)) do |acc,el|
  acc.zip(primes(el)).collect { |xs| xs[1] ? xs.max : xs[0] }
end.zip((1..20).to_a).collect { |xs| xs[1] ** xs[0] }.reduce(:*)

puts result

