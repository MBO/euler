#!/usr/bin/env ruby1.9

#***************************************************************************
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#***************************************************************************

result = (1...1000).inject(0) do |acu,elem|
  acu += elem if (elem % 3 == 0) || (elem % 5 == 0)
  acu
end

puts result
