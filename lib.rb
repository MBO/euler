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

# used in euler021.rb
def divisors(num)
  factors = factorize(num)
  divisors = factors.map { |k,v| v.times.map{k} }.flatten
  combined_divisors = []
  divisors.length.downto(1).each do |i|
    combined_divisors += divisors.combination(i).to_a
  end
  combined_divisors.map!{|t| t.inject{|ac,el|ac*el}}
  combined_divisors.uniq.sort[0..-2]
end

# used in euler023.rb
def abundant?(num)
  divisors(num).reduce(:+) > num
end

# used in euler042.rb
def triangle?(num)
  sqrt = Math.sqrt(num * 2)
  a = sqrt.floor
  b = a+1
  (a*b)/2 == num
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

# used in euler026
def fraction(num)
  digits = [] # rests from divisions, for cycle detection
  fracts = [] # fraction numbers, for decima representation
  r = 1 # digit we divide, will be rest from division in next iteratins
  while !digits.member?(r) # while not yet cycle detected
    digits << r
    q,r = r.divmod(num)
    fracts << q
    break if r == 0
    r *= 10 # add next '0' to the right side
  end

  str = fracts[0].to_s
  if fracts.length > 1
    str += "."
    (1...fracts.length).each do |i|
      str += "(" if digits[i] == r
      str += fracts[i].to_s
    end
    str += ")" if r != 0
  end

  str
end

# used in euler028-1.rb
class SpiralGen
  include Enumerable

  def each
    x,y = 0,0 # position relatively to center
    i = 0 # number of moves done in direction
    num = 1 # number of moves to be done in direction
    dir = 1 # direction of moves, 1 - move right then down, -1 - move left, the up
    yield [0,0]
    loop do
      if i < num # make step in direction
        x += dir
      else
        y += dir
      end

      i += 1 # add step to counter
      if i == num*2 # if done enough steps
        dir = 0 - dir # change direction
        num += 1 # increment max step counter in direction
        i = 0 # and reset step counter
      end

      yield [x,y]
    end
  end
end
