class Solution {
    public int solution(int a, int b) {
        String strA = String.valueOf(a);
        String strB = String.valueOf(b);
        int answer1 = Integer.parseInt(strA + strB);
        int answer2 = 2 * a * b;
        return answer1 > answer2 ? answer1 : answer2;
    }
}