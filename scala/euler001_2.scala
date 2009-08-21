object euler001_2 {
    def main(args : Array[String]) : Unit = {
        val rs = List[Int](0,3,5,6,9,10,12)
        val list = (1 to 999).filter(x => rs.contains(x % 15))
        val sum = (0 /: list) (_ + _) // fold left
        println(sum)
    }
}
