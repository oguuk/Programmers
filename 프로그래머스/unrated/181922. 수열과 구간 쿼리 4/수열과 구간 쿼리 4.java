import java.util.*;

class Solution {
    public int[] solution(int[] arr, int[][] queries) {
        for(int[] q: queries) {
            for(int i = q[0]; i <= q[1]; i++) {
                if(q[2] != 0 && i % q[2] == 0) {
                    arr[i] += 1;
                }
            }
        }
        return arr;
    }
}