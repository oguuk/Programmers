class Solution {
    public String solution(String str1, String str2) {
        String answer = "";
        for(int i = 0; i < str1.length(); i++) {
            answer = answer.concat(String.valueOf(str1.charAt(i))).concat(String.valueOf(str2.charAt(i)));
        }
        return answer;
    }
}