import java.util.*;
import java.util.stream.*;

class Solution {
    public int solution(int[] num_list) {
        return num_list.length > 10 ? Arrays.stream(num_list).sum() : Arrays.stream(num_list).reduce((i, j) -> i * j).orElse(0);
    }
}
