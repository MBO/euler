#!/usr/bin/env runhaskell
--
-- A palindromic number reads the same both ways. The largest palindrome made
-- from the product of two 2-digit numbers is 9009 = 91  99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.
--

module Main where

palindrome n = str == rev
    where str = show n
          rev = reverse str

main = print $ foldl1 (max) $ filter (palindrome) [ a*b | a <- reverse [100..999], b <- reverse [100..a] ]
