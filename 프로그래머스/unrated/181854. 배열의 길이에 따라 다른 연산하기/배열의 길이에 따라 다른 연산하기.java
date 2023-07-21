import java.util.stream.*;
class Solution {
    public int[] solution(int[] arr, int n) {
        return IntStream.range(0, arr.length)
            .map(i -> arr.length % 2 == 0 ? (i % 2 != 0 ? arr[i] + n : arr[i]) : (i % 2 == 0 ? arr[i] + n : arr[i]))
            .toArray();
    }
}