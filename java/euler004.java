class euler004 {
    private static String reverse(String str) {
        char[] chars = str.toCharArray();
        for (int i = 0; i < chars.length/2; i++) {
            char tmp = chars[i];
            chars[i] = chars[chars.length-i-1];
            chars[chars.length-i-1] = tmp;
        }
        StringBuffer buff = new StringBuffer();
        for (int i = 0; i < chars.length; i++) {
            buff.append(chars[i]);
        }
        return buff.toString();
    }

    private static boolean isPalindrome(int num) {
        String str = "" + num;
        String rev = reverse(str);
        return str.equals(rev);
    }

    public static void main(String[] args) {
        int max = -1;
        for (int a = 999; a >= 100; a--) {
            for (int b = a; b >= 100; b--) {
                int num = a * b;
                if ((num > max) && isPalindrome(num)) {
                    max = num;
                }
            }
        }
        System.out.println(max);
    }
}
