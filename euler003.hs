#!/usr/bin/env runhaskell
--
-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?
--

module Main where

primeFactors' :: (Integral a) => a -> a -> [a]
primeFactors' 0 _ = []
primeFactors' 1 _ = []
primeFactors' 2 _ = [2]
primeFactors' n x =
    if x > n then
        []
    else
        if n `mod` x == 0 then
            x : primeFactors' (n `div` x) x
        else
            primeFactors' n (x+1)

primeFactors :: (Integral a) => a -> [a]
primeFactors n = primeFactors' n 2


num = 600851475143                                            
main = print $ last $ primeFactors num

