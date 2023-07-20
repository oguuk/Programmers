import java.util.*;

public class Solution {
    public int[] solution(int []arr) {
        ArrayList<Integer> answer = new ArrayList<>();
        for (int a: arr) {
            if (answer.size() == 0 || answer.get(answer.size() - 1) != a) answer.add(a);
        }
        return answer.stream().mapToInt(Integer::intValue).toArray();
    }
}