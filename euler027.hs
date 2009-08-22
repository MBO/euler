#!/usr/bin/env runhaskell
--
-- Euler published the remarkable quadratic formula:
--
-- n^2 + n + 41
--
-- It turns out that the formula will produce 40 primes for the consecutive
-- values n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41
-- is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly
-- divisible by 41.
--
-- Using computers, the incredible formula  n^2 - 79n + 1601 was discovered,
-- which produces 80 primes for the consecutive values n = 0 to 79. The
-- product of the coefficients, 79 and 1601, is 126479.
--
-- Considering quadratics of the form:
-- n^2 + an + b, where |a| < 1000 and |b| < 1000
--
-- where |n| is the modulus/absolute value of n
-- e.g. |11| = 11 and |4| = 4
--
-- Find the product of the coefficients, a and b, for the quadratic
-- expression that produces the maximum number of primes for consecutive
-- values of n, starting with n = 0.
--

module Main where

import Data.List

isPrime = not . isComposite
isComposite n = any (\p -> n `mod` p == 0) . testFactorsFor $ n
    where testFactorsFor n = takeWhile (\p -> p^2 <= n) primes
primes =  2 : [ x | x <- [ 3, 5 .. ], not . isComposite $ x ]

numberOfPrimes pair = length $ takeWhile (\x -> (x >= 2) && (isPrime x) )$ map (\n -> n^2 + a*n + b) [0 ..]
    where a = fst pair
          b = snd pair
testNumbers = [ (a,b) | b <- takeWhile (<1000) primes, a <- [-b+2, -b+4 .. 999] ]

maxPair = fst $ foldl1' (\x y -> if ((>) (snd x) (snd y)) then x else y ) $ map (\x -> (x, numberOfPrimes x)) testNumbers

main = print $ (fst maxPair) * (snd maxPair)
