#!/usr/bin/env ruby1.9

#***************************************************************************
# A perfect number is a number for which the sum of its proper divisors
# is exactly equal to the number. For example, the sum of the proper
# divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is
# a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
# smallest number that can be written as the sum of two abundant numbers is
# 24. By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers. However,
# this upper limit cannot be reduced any further by analysis even though
# it is known that the greatest number that cannot be expressed as the
# sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as
# the sum of two abundant numbers.
#***************************************************************************

require "lib.rb"

MAX = 28123
DEBUG = false
result_nums = Array(0..MAX)
abundants = []

(12..MAX).each do |num|
  puts "#{num}:" if DEBUG
  if abundant?(num)# and result_nums[num] != 0
    abundants << num
    puts "  abts: #{abundants}" if DEBUG
    print "  a:" if DEBUG
    abundants.each do |abundant|
      a = num+abundant
      while a <= MAX #
        print " #{a}" if DEBUG
        result_nums[a] = 0
        a += abundant
      end
    end
    puts if DEBUG
  end
end

puts result_nums.reduce(:+)

