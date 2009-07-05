#!/usr/bin/env ruby1.9

require 'mathn'

num, factor = 600_851_475_143, 0

primes = Prime.instance.each
while num > 1
  factor = primes.next
  num /= factor while num % factor == 0
end

puts factor
