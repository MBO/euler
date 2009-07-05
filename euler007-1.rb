#!/usr/bin/env ruby1.9

#******************************************************************************
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.
#
# What is the 10001st prime number?
#******************************************************************************
require 'mathn'

primes = Prime.instance.each
10_000.times { primes.next }
result = primes.next
puts result
