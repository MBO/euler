#!/usr/bin/env ruby1.9

#******************************************************************************
# A permutation is an ordered arrangement of objects. For example,
# 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of
# the permutations are listed numerically or alphabetically, we call it
# lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
#
#   012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1,
# 2, 3, 4, 5, 6, 7, 8 and 9?
#******************************************************************************

def factorial(n)
  1.upto(n).inject(:*)
end

def permutation(num, s)
  fact = factorial(s.length-1)
  0.upto(s.length-2) do |i|
    tmpi = (num / fact) % (s.length - i)

    tmps = s[i + tmpi]
    s[i + 1, tmpi] = s[i, tmpi] if tmpi > 0
    s[i] = tmps

    fact /= (s.length - i - 1)
  end
  s
end

puts permutation(  999_999, (0..9).to_a).join
