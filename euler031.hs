#!/usr/bin/env runhaskell
--
-- In England the currency is made up of pound, £, and pence, p, and there
-- are eight coins in general circulation:
--   1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
--
-- It is possible to make £2 in the following way:
--   1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
--
-- How many different ways can £2 be made using any number of coins?
--

module Main where

combineNominals :: (Num a, Enum a, Integral b) => a -> [a] -> b
combineNominals 0 _ = 1
combineNominals _ [] = 0
combineNominals desired (x:xs) = sum combined
    where combined = map (\n -> combineNominals (desired - n) xs) nominals 
          nominals = [ 0, x .. desired ]

main = print $ combineNominals 200 $ reverse [1,2,5,10,20,50,100,200]
