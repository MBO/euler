#!/bin/sh
exec scala "$0" "$@"
!#

class FibIterator extends Iterator[Int] {
    private var p : (Int,Int) = (0,1)
    override def hasNext() = true
    override def next() : Int = {
        p = (p._2, p._1+p._2)
        p._1
    }
}
val list = (new FibIterator).takeWhile(_ < 4000000).filter(_ % 2 == 0)
val sum = (0 /: list) (_ + _)
println(sum)
