class Solution {
    public int solution(int a, int b) {
        return ((a & b) & 1) == 1 ? (int) (Math.pow(a, 2) + Math.pow(b, 2)) : ((a | b) & 1) == 0 ? Math.abs(a - b) : 2 * (a + b);
    }
}