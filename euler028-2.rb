#!/usr/bin/env ruby1.9

#***************************************************************************
# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:
#
#   21 22 23 24 25
#   20  7  8  9 10
#   19  6  1  2 11
#   18  5  4  3 12
#   17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?
#***************************************************************************

require "lib"

# a hell lot faster version

result = 1

(1..500).each do |i|
  right_up = (i*2+1)**2
  left_down = (i*2)**2+1
  diff = right_up - left_down
  right_down,left_up = left_down - diff, left_down + diff
  result += [right_up, left_down, right_down, left_up].inject(:+)
end
puts result

