#!/usr/bin/env groovy

//***************************************************************************
// The sum of the squares of the first ten natural numbers is,
// 1^2 + 2^2 + ... + 10^2 = 385
//
// The square of the sum of the first ten natural numbers is,
// (1 + 2 + ... + 10)^2 = 55^2 = 3025
//
// Hence the difference between the sum of the squares of the first ten
// natural numbers and the square of the sum is 3025  385 = 2640.
//
// Find the difference between the sum of the squares of the first one
// hundred natural numbers and the square of the sum.
//***************************************************************************

def max = 100

def sum = (max*(1 + max)/2).toInteger()
def square_sum = sum**2

//  1   2   3   4   5   6   7   8   9  10
//  1   4   9  16  25  36  49  64  81 100
//  1   5  14  30  55  91 140 204 285 385
def sum_squares = (max*(max+1)*(2*max+1)/6).toInteger()

def difference = square_sum - sum_squares
println difference
