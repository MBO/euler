#!/usr/bin/env ruby1.9

#******************************************************************************
# Using names.txt (right click and 'Save Link/Target As...'), a 46K
# text file containing over five-thousand first names, begin by sorting
# it into alphabetical order. Then working out the alphabetical value for
# each name, multiply this value by its alphabetical position in the list
# to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?
#******************************************************************************

infile = File.join(File.dirname(__FILE__), "files022", "names.txt")

def alphabetical_value(name)
  name.split(//).map { |a| a.ord - 'A'.ord + 1 }.inject(:+)
end

names = []
File.open(infile, "rt:ascii") do |file|
  names.concat file.readline.split(/,/).map { |el| el.gsub(/\A"|"\Z/m, "") }
end

names.sort!

values = names.map { |name| alphabetical_value(name) }
result = values.map.with_index { |val,idx| val * (idx+1) }.inject(:+)
puts result

