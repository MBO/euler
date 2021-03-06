#!/bin/sh
exec scala "$0" "$@"
!#

def isPalindrome(n : Int) : Boolean = {
    val str = n.toString()
    val rev = str.reverse.toString
    str == rev
}
val numbers = for {
    a <- (100 to 999).reverse;
    b <- (100 to a).reverse
    prod = a * b
    if isPalindrome(prod)
} yield prod
val result = numbers.reduceLeft(_.max(_))
println(result)
