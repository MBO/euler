#!/usr/bin/env groovy

//****************************************************************************
// A palindromic number reads the same both ways. The largest palindrome made
// from the product of two 2-digit numbers is 9009 = 91  99.
//
// Find the largest palindrome made from the product of two 3-digit numbers.
//****************************************************************************

println (999..100).each { a ->
    (a..100).each { b ->
        def str = (a*b).toString()
        if (str == str.split('').reverse().join('')) return str
    }
}

