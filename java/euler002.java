class euler002 {
    public static void main(String[] args) {
        int a = 0, b = 1;
        long sum = 0;

        while (b < 4000000) {
            int tmp = a;
            a = b;
            b += tmp;
            if (b % 2 == 0) {
                sum += b;
            }
        }

        System.out.println(sum);
    }
}
