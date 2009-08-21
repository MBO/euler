#!/bin/sh
exec scala "$0" "$@"
!#

def sumEl(firstEl :Int, lastEl :Int, n :Int) :Int = (firstEl + lastEl) * n / 2
val sum_of_3 = sumEl(3, 999, 999 / 3)
val sum_of_5 = sumEl(5, 995, 995 / 5)
val sum_of_15 = sumEl(15, 990, 990 / 15)

val sum = sum_of_3 + sum_of_5 - sum_of_15
println(sum)
