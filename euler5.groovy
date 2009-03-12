#!/usr/bin/env groovy

//***************************************************************************
// 2520 is the smallest number that can be divided by each of the numbers
// from 1 to 10 without any remainder.
//
// What is the smallest number that is evenly divisible by all of the numbers
// from 1 to 20?
//***************************************************************************

def range = (1..20)
def get_factors(n) {
    def factors = [0,0,0]
    def i = 2
    while (n > 1) {
        if (n % i == 0) {
            n = (n/i).toInteger()
            factors[i]++
            continue
        }
        factors[++i] = 0
    }
    factors
}

def all_num_factors = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
range.each {
    def factors = get_factors(it)
    factors.eachWithIndex { num,i ->
        if (num && (!all_num_factors[i] || all_num_factors[i] < num)) {
            all_num_factors[i] = num
        }
    }
}

def result = 1
all_num_factors.eachWithIndex { num,i ->
    result *= i**num
}
println result

