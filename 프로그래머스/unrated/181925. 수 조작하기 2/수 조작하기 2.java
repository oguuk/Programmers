import java.util.*;

class Solution {
    public String solution(int[] numLog) {
        StringBuilder builder = new StringBuilder();
        for(int i = 1; i < numLog.length; i++) {
            switch(numLog[i] - numLog[i - 1]) {
                case 1: builder.append("w"); break;
                case -1: builder.append("s"); break;
                case 10: builder.append("d"); break;
                default: builder.append("a");
            }
        }
        return builder.toString();
    }
}