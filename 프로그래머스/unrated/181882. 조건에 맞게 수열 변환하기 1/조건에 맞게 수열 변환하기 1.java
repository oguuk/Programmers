import java.util.stream.*;
class Solution {
    public int[] solution(int[] arr) {
        return IntStream.range(0, arr.length)
            .map(i -> arr[i])
            .map(i -> (i < 50 && i % 2 != 0) ? i * 2 : (i >= 50 && i % 2 == 0) ? i / 2 : i )
            .toArray();
    }
}