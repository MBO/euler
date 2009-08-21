#!/usr/bin/env runhaskell
--
-- The number, 197, is called a circular prime because all rotations of
-- the digits: 197, 971, and 719, are themselves prime.
--
-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
-- 31, 37, 71, 73, 79, and 97.
--
-- How many circular primes are there below one million?
--

module Main where

import Data.Char
import Data.List
import Data.Function

primes =  2 : [ x | x <- [ 3, 5 .. ], not . isComposite $ x ]
    where isComposite n = any (\p -> n `mod` p == 0) . factorsFor $ n
          factorsFor n = takeWhile (\p -> p*p <= n) primes

rotate [] _ = []
rotate xs 0 = xs
rotate (x:xs) (n+1) = rotate (xs ++ [x]) n

rotations x = take (length . show $ x) $ map (\n -> read (rotate (show x) n) :: Integer) [ 0 .. ]

primesList = groupBy ((==) `on` (length . show)) $ takeWhile (< 10^6) primes

circularPrimes = map (\ps -> filter (f ps) ps) primesList
    where f ps p = (all (\r -> r >= p) (rs p)) && (all (\r -> r `elem` ps) (rs p))
          rs p = rotations p

main = print . length $ foldl1 (union) $ map (rotations) $ concat circularPrimes
