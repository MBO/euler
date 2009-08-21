class euler003 {
    public static boolean isPrime(long n) {
        if (n <= 2) {
            return n == 2;
        }

        for (int i = 2; i < (int) Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        long num = 600851475143L;
        long sqrt = (long) Math.sqrt(num); // only check to square root of num, we look for prime factors, not all factors
        long lastPrime = -1;
        for (long i = 3; i < sqrt; i++) {
            if (num % i == 0) { // is factor of num
                if (isPrime(i)) { // and is prime
                    lastPrime = i;
                }
            }
        }
        System.out.println(lastPrime);
    }
}
