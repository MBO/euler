public class euler001 {
    private static int sum(int a1, int an, int n) {
        return (a1 + an) * n / 2;
    }

    public static void main(String[] args) {
        long sum_of_3 = sum(3, 999, 999 / 3);
        long sum_of_5 = sum(5, 995, 995 / 5);
        long sum_of_15 = sum(15, 990, 990 / 15);

        long sum = sum_of_3 + sum_of_5 - sum_of_15;
        System.out.println(sum);
    }
}

