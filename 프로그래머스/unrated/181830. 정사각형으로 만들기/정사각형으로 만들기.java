import java.util.*;
class Solution {
    public int[][] solution(int[][] arr) {
        int LENGHT = arr.length > arr[0].length ? arr.length : arr[0].length;
        int[][] answer = new int[LENGHT][LENGHT];
        for (int r = 0; r < LENGHT; r++) {
            for (int c = 0; c < LENGHT; c++) {
                if (r < arr.length && c < arr[0].length) answer[r][c] = arr[r][c];
                else answer[r][c] = 0;
            }
        }
        return answer;
    }
}