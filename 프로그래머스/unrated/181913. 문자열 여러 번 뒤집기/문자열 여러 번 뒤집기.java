class Solution {
    public String solution(String my_string, int[][] queries) {
        StringBuilder builder = new StringBuilder();
        for (Character c: my_string.toCharArray()) {
            builder.append(c);
        }
        for (int[] q: queries) {
            for(int i = q[1]; i > (q[1] + q[0]) / 2; i--) {
                Character ch = builder.charAt(i);
                builder.setCharAt(i, builder.charAt(q[1] - i + q[0]));
                builder.setCharAt(q[1] - i + q[0], ch);
            }
        }
        return builder.toString();
    }
}