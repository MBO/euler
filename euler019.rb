#!/usr/bin/env ruby1.9

#***************************************************************************
# You are given the following information, but you may prefer to do some
# research for yourself.
# * 1 Jan 1900 was a Monday.
# * Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
# * A leap year occurs on any year evenly divisible by 4, but not on a
#   century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth
# century (1 Jan 1901 to 31 Dec 2000)?
#***************************************************************************

require "date"

d_start = Date.new(1901, 1, 1)
d_end = Date.new(2000, 12, 31)
result = 0

date = d_start
while date < d_end do
  result += 1 if date.sunday?
  date = date.next_month
end

puts result
