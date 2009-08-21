#!/usr/bin/env ruby1.9

#***************************************************************************
# In England the currency is made up of pound, £, and pence, p, and there
# are eight coins in general circulation:
#   1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
#   1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
#
# How many different ways can £2 be made using any number of coins?
#***************************************************************************

def combine_nominals(desired, nominals)
  return 1 if desired == 0
  return 0 if nominals.empty?

  nominal = nominals[0]
  result = 0
  (0..desired).step(nominal).each do |actual|
    result += combine_nominals(desired-actual, nominals[1..-1])
  end
  result
end

result = combine_nominals(200, [1,2,5,10,20,50,100,200].reverse)
puts result
