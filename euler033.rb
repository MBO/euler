#!/usr/bin/env ruby1.9

#***************************************************************************
# The fraction 49/98 is a curious fraction, as an inexperienced
# mathematician in attempting to simplify it may incorrectly believe that
# 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction,
# less than one in value, and containing two digits in the numerator
# and denominator.
#
# If the product of these four fractions is given in its lowest common
# terms, find the value of the denominator.
#***************************************************************************

results = []

(10..99).each do |a|
  (10..99).each do |b|
    next if a >= b

    fract = [a,b]
    numerator = fract.first.to_s.split(//)
    denominator = fract.last.to_s.split(//)

    common_digit = numerator & denominator

    if common_digit.length == 1 and common_digit[0] != "0"
      numerator -= common_digit
      denominator -= common_digit

      new_fract = [numerator[0].to_i,denominator[0].to_i]
      unless new_fract.last == 0
        next unless new_fract.first * fract.last == fract.first * new_fract.last
        results << fract
      end
    end
  end
end

result = results.map{|a,b| Rational(a,b)}.reduce(:*).denominator

puts result
