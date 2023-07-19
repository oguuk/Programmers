import java.util.stream.*;
class Solution {
    public String solution(int q, int r, String code) {
        return IntStream.range(0, code.length())
                .filter(i -> i % q == r)
                .mapToObj(j -> String.valueOf(code.charAt(j)))
                .collect(Collectors.joining());
    }
}