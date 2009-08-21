#!/bin/sh
exec scala "$0" "$@"
!#

def isPrime(n : Int) : Boolean = {
    if (n <= 2) n == 2 else ! ((2 to Math.sqrt(n)) exists (n % _ == 0))
}

val num = 600851475143L
val results = (3 to Math.sqrt(num).asInstanceOf[Int]).filter(isPrime(_)).filter(num % _ == 0)
println(results.last)
