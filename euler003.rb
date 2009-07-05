#!/usr/bin/env ruby

#****************************************************************************
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#****************************************************************************

num = 600851475143
def prime?(n)
  return true if [2,3,4,7,11,13,17,19].include?(n)
  sqrt = Math.sqrt(n).to_i
  (2..sqrt).all? { |i| n % i != 0 }
end

sqrt = Math.sqrt(num).to_i
puts (2..sqrt).to_a.reverse.find { |i| (num % i == 0) && prime?(i) }

