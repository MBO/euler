#!/usr/bin/env ruby1.9

#******************************************************************************
# By starting at the top of the triangle below and moving to adjacent
# numbers on the row below, the maximum total from top to bottom is 23.
#
#  3
#  7 5
#  2 4 6
#  8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in triangle.txt (right click
# and 'Save Link/Target As...'), a 15K text file containing a triangle
# with one-hundred rows.
#
# NOTE: This is a much more difficult version of Problem 18. It is not
# possible to try every route to solve this problem, as there are 299
# altogether! If you could check one trillion (1012) routes every second
# it would take over twenty billion years to check them all. There is an
# efficient algorithm to solve it. ;o)
#******************************************************************************

infile = File.join(File.dirname(__FILE__), "files067", "triangle.txt")
triangle = []
File.open(infile, "rt:ascii") do |file|
  file.each_line do |line|
    triangle << line.split(/ /).map { |i| i.to_i(10) }
  end
end

while triangle.length > 1
  last_row = triangle.pop

  actual = triangle.last
  0.upto(actual.length-1).each do |i|
    actual[i] += [last_row[i],last_row[i+1]].max
  end
end

result = triangle[0][0]
puts result
