#!/usr/bin/env ruby1.9

infile = File.join(File.dirname(__FILE__), "files008", "input")

digits = []
File.open(infile, "r:ascii") do |file|
  file.each_line do |line|
    digits.concat line.chomp.split(//).map { |i| i.to_i }
  end
end

max = 0
sums = (4...1000).map do |idx|
  digits.values_at(idx-4, idx-3, idx-2, idx-1, idx).inject(:*)
end

result = sums.max
puts result
