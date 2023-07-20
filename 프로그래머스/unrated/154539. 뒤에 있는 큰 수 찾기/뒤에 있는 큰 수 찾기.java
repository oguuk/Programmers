import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

class Solution {
    public int[] solution(int[] numbers) {
        Stack<Integer> stack = new Stack<>();
        int[] answer = new int[numbers.length];
        for (int i = numbers.length - 1; i > -1; i--) {
            if (stack.isEmpty()){
                answer[i] = -1;
                stack.push(numbers[i]);
            } else {
                ArrayList<Integer> list = new ArrayList<>();
                while (!stack.isEmpty()) {
                    int big = stack.pop();
                    list.add(big);
                    if (big > numbers[i]) {
                        answer[i] = big;
                        break;
                    }
                }
                if (answer[i] == 0) {
                    answer[i] = -1;
                } else {
                    for (int t: list) stack.push(t);
                }
                stack.add(numbers[i]);
            }
        }
        return answer;
    }
}