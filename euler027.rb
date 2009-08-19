#!/usr/bin/env ruby1.9

#***************************************************************************
# Euler published the remarkable quadratic formula:
#
# n^2 + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive
# values n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41
# is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly
# divisible by 41.
#
# Using computers, the incredible formula  n^2 - 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values n = 0 to 79. The
# product of the coefficients, 79 and 1601, is 126479.
#
# Considering quadratics of the form:
# n^2 + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |4| = 4
#
# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for consecutive
# values of n, starting with n = 0.
#***************************************************************************

require "mathn"

def formula(n, a, b)
  n**2 + a*n + b
end
def num_of_primes(a,b)
  n = 0
  while formula(n, a, b).prime?
    n += 1
  end
  n
end

max_primes = [0,0,0]
Prime.instance.take_while{|p| p < 1_000 }.each do |b| # should be prime number because formula(0,_,_) should be prime
  ((-b+2)..1000).step(2).each do |a| # formula(1,a,b) should be prime and positive, so a > b, and a should be odd (step 2)
    num = num_of_primes(a,b)
    if num > max_primes[0]
      max_primes = [num,a,b]
    end
    num = num_of_primes(-a,b)
    if num > max_primes[0]
      max_primes = [num,-a,b]
    end
  end
end

result = max_primes[1..2].inject(:*)
puts result
