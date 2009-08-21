#!/usr/bin/env runhaskell
--
-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
--
-- Find the sum of all numbers which are equal to the sum of the factorial of their digits.
--
-- Note: as 1! = 1 and 2! = 2 are not sums they are not included.
--

module Main where

import Data.Char (digitToInt)

main = print $ sum [ x | x <- [ 10 .. 100000 ], x == (sum $ map (\n -> product [ 1 .. n ]) $ map digitToInt $ show x) ]
    -- upper bound should  be set to 7 * 9!, < 9999999
    -- but for test performance set to lower value
