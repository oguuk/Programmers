class Solution {
    public int solution(String binomial) {
        String[] split = binomial.split(" ");
        switch (split[1]) {
            case "+": return Integer.parseInt(split[0]) + Integer.parseInt(split[2]);
            case "-": return Integer.parseInt(split[0]) - Integer.parseInt(split[2]);
            default: return Integer.parseInt(split[0]) * Integer.parseInt(split[2]);
        }
    }
}