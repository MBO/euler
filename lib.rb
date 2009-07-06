#!/usr/bin/env ruby1.9

# used on euler002
class Fibs
  include Enumerable

  def each
    a,b = 1,1
    loop do
      yield a
      a,b = b,a+b
    end
  end
end

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

# used in euler007-2, euler010-2
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

# used in euler012
class Triangles
  include Enumerable

  def each
    i, sum = 1, 1
    loop do
      yield sum
      i += 1
      sum += i
    end
  end
end

# used in euler003-3, euler005-1
def factorize(num)
  sqrt = Math.sqrt(num).to_i
  divisors = Hash.new(0)
  2.upto(sqrt).each do |i|
    while num % i == 0
      num /= i
      divisors[i] += 1
    end
  end
  divisors[1] = 1
  divisors[num] = 1
  divisors
end

# used in euler012
def divisors_count(num)
  sqrt = Math.sqrt(num).to_i
  divisors = []
  2.upto(sqrt).each do |i|
    p = 0
    while num % i == 0
      num /= i
      p += 1
    end
    divisors << p if p > 0
  end
  divisors.empty? ? 2 : divisors.inject(1) { |acc,el| acc * (el+1) }
end

