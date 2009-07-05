#!/usr/bin/env ruby1.9

#******************************************************************************
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#******************************************************************************

result = 0
1.upto(500) do |b|
  1.upto(b) do |a|
    c = Math.sqrt(a**2 + b**2)
    if a + b + c == 1_000
      result = (a * b * c).to_i
    end
  end
end
puts result
