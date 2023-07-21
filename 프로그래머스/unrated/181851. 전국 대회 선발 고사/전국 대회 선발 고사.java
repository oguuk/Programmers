import java.util.*;
import java.util.stream.*;

// 문제 gz같네

class Solution {
    public int solution(int[] rank, boolean[] attendance) {
        Integer[] sorted = IntStream.range(0, rank.length)
            .filter(i -> attendance[i])
            .boxed()
            .sorted(Comparator.comparing(i -> rank[i]))
            .toArray(Integer[]::new);
        return 10000 * sorted[0] + 100 * sorted[1] + sorted[2];
    }
}