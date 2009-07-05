#!/usr/bin/env ruby1.9

#***************************************************************************
# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is 3025  385 = 2640.
#
# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.
#***************************************************************************

sum = (100*(1 + 100)/2).to_i
square_of_sum = sum**2
sum_of_squares = 1.upto(100).inject(0) { |acu,el| acu + el**2 }

result = square_of_sum - sum_of_squares
puts result
