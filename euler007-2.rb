#!/usr/bin/env ruby1.9

#*****************************************************************************
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
# can see that the 6th prime is 13.
#
# What is the 10001st prime number?
#*****************************************************************************

class Sieve
  def initialize(max)
    @max = max
    @sieve = Array.new(max)

    2.upto(max) { |n| sieve(n) }
  end

  def prime?(n)
    return @sieve[n]
  end

  def sieve(n)
    return if @sieve[n] != nil
    @sieve[n] = true
    (n+n).step(@max, n) { |i| @sieve[i] = false }
    return true
  end
end

class Primes
  include Enumerable

  def initialize(max)
    @max = max
    @sieve = Sieve.new(max)
    @i = 2
  end

  def each
    i = 2
    while i < @max
      if @sieve.prime?(i)
        yield i
      end
      i += 1
    end
  end
end

p = Primes.new(200_000)
i = 0
result = nil
p.each do |prime|
  i += 1
  if i == 10_001
    result = prime
    break
  end
end
puts result
