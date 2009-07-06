#!/usr/bin/env ruby1.9

#******************************************************************************
# Starting in the top left corner of a 2x2 grid, there are 6 routes
# (without backtracking) to the bottom right corner.
#
#    __  _    _
#      |  |_   |
#      |    |  |_
#
#   |__  |_   |
#      |   |_ |__
#
# How many routes are there through a 20x20 grid?
#******************************************************************************

@moves = {
  [0,0] => 0,
  [0,1] => 1
}
def num_of_routes(x,y)
  pos = [x,y].sort
  if x == 0 or y == 0
    @moves[ pos ] = 1
  elsif @moves[ pos ].nil?
    m1 = num_of_routes(x-1,y)
    m2 = num_of_routes(x,y-1)
    @moves[ pos ] = m1 + m2
  else
    @moves[ pos ]
  end
end

puts num_of_routes(20,20)
