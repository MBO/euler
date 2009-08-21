#!/usr/bin/env runhaskell
--
--
-- If we list all the natural numbers below 10 that are multiples of 3 or 5,
-- we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
-- Find the sum of all the multiples of 3 or 5 below 1000.
--

module Main where

main = print $ sum $ takeWhile (< 1000) [ x | x <- [1 .. ], (x `mod` 15) `elem` [0,3,5,6,9,10,12]]
