#!/usr/bin/env ruby

#****************************************************************************
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?
#****************************************************************************

@num = 600_851_475_143
@primes = [2,3,4,7,11,13,17,19]

def prime?(n)
  return true if @primes.include?(n)
  return false if n <= @primes.last

  sqrt = Math.sqrt(n).to_i
  @primes.last.upto(sqrt).all? { |i| n % i != 0 }
end

sqrt = Math.sqrt(@num).to_i
result = sqrt.downto(2).find do |i|
  @num % i == 0 and prime?(i)
end

puts result

