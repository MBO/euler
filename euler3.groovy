#!/usr/bin/env groovy

//****************************************************************************
// The prime factors of 13195 are 5, 7, 13 and 29.
//
// What is the largest prime factor of the number 600851475143 ?
//****************************************************************************

def number = 600851475143

def is_prime(n) {
    if (n == 2 || n == 3 || n == 5 || n == 7) return true
    def sqrt = Math.sqrt(n).toInteger()
    return (2..sqrt).every { n % it != 0 }
}

def sqrt = Math.sqrt(number).toInteger()
def prime = (sqrt..2).find { number % it == 0 && is_prime(it) }
println prime
