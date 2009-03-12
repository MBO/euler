#!/usr/bin/env groovy

//****************************************************************************
// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91  99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.
//****************************************************************************

//   9  8  7  6  5  4  3  2  1
// 9 81 72 63 54 45 36 27 18  9
// 8    64 56 48 40 32 24 16  8
// 7       49 42 35 28 21 14  7
// 6          36 30 24 18 12  6
// 5             25 20 15 10  5
// 4                16 12  8  4
// 3                    9  6  3
// 2                       4  2
// 1                          1
//
// 99 98 88 97 87 96 77 88 ...

def nums = []
(100..999).each { a ->
    (100..a).each { b ->
        nums << a*b
    }
}
def res = nums.sort().reverse().find {
    it.toString() == it.toString().split('').reverse().join('')
}
println res

