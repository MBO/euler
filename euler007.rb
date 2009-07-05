#!/usr/bin/env ruby1.9

require 'mathn'

primes = Prime.instance.each
10_000.times { primes.next }
result = primes.next
puts result
