#!/usr/bin/env ruby1.9

#******************************************************************************
# If the numbers 1 to 5 are written out in words: one, two, three, four,
# five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written
# out in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
# and forty-two) contains 23 letters and 115 (one hundred and fifteen)
# contains 20 letters. The use of "and" when writing out numbers is in
# compliance with British usage.
#******************************************************************************

@words1 = ["", "one", "two", "three", "four", "five", "six", "seven", "eigth", "nine",
  "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
  "seventeen", "eighteen", "nineteen"]
@words2 = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy",
  "eighty", "ninety"]

def to_words(num)
  case
  when num < 20
    @words1[num]
  when num < 100
    @words2[(num / 10).to_i] + @words1[num % 10]
  when num < 1000
    if num % 100 != 0
      @words1[(num / 100).to_i] + "hundredand" + to_words(num % 100)
    else
      @words1[(num / 100).to_i] + "hundred"
    end
  when num == 1000
    "onethousand"
  end
end

words = 1.upto(1_000).map { |i| to_words(i) }
lengths = words.map { |w| w.length }
result = lengths.inject(:+)
puts result
