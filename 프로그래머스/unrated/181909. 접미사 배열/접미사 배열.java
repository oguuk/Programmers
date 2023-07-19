import java.util.stream.*;

class Solution {
    public String[] solution(String my_string) {
        String[] answer = {};
        return IntStream.range(0, my_string.length())
                .mapToObj(i -> my_string.substring(i))
                .sorted()
                .toArray(String[]::new);
    }
}