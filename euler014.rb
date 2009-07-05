#!/usr/bin/env ruby1.9

#******************************************************************************
# The following iterative sequence is defined for the set of positive integers:
#
#   n -> n/2 (n is even)
#   n -> 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#   13  40  20  10  5  16  8  4  2  1
#
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#******************************************************************************

def next_step(n)
  if n.even?
    n/2.to_i
  else
    3*n+1
  end
end

@chains = [0, 1]

def chain_length(num)
  steps = 0
  path = []
  while (@chains[num] rescue nil).nil?
    steps += 1
    path << num
    num = next_step(num)
  end
  steps += @chains[num]

  len = steps
  while !path.empty?
    idx = path.shift
    @chains[idx] = len if idx < 1_000_000
    len -= 1
  end
  steps
end

500_001.upto(999_999).map do |i|
  chain_length(i)
end

result = 500_001.upto(999_999).inject(0) { |acc,el| @chains[acc] > @chains[el] ? acc : el }
puts result

