#!/usr/bin/env groovy

//***************************************************************************
// If we list all the natural numbers below 10 that are multiples of 3 or 5,
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
// Find the sum of all the multiples of 3 or 5 below 1000.
//***************************************************************************

// 03  06  09  12  15  18  21  24  27  30  33  36  39  42  45  48  51  54  57  60
//   05      10    15    20      25    30    35      40    45    50      55    60

def range = 1..<1000

println range.findAll { (it % 3 == 0) || (it % 5 == 0) }.inject(0) { sum,i -> sum += i }
//def sum = 0
//range.each { if ((it % 3 == 0) || (it % 5 == 0)) sum += it }
//println sum

