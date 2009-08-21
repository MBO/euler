#!/usr/bin/env runhaskell
--
-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
-- can see that the 6th prime is 13.
--
-- What is the 10001st prime number?
--

module Main where

primes =  2 : [ x | x <- [ 3 .. ], not $ composite x ]
    where composite x = any (\n -> x `mod` n == 0) $ factors x
          factors x = takeWhile (<= (sqr x)) primes
          sqr x = floor $ sqrt $ fromIntegral x
main = print $ primes !! 10000
