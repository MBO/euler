#!/usr/bin/env ruby1.9

#******************************************************************************
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
#******************************************************************************

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

primes = Primes.new(2_000_000)
sum = primes.inject(:+)
result = sum
puts result
