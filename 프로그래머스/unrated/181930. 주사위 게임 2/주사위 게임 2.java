import java.util.stream.*;

class Solution {
    
    public int pow(int a, int b) {
        return IntStream.range(0, b).reduce(1, (i, j) -> i * a);
    } 
    
    public int solution(int a, int b, int c) {
        if (a == b && b == c) {
            return (a + b + c) * (pow(a, 2) + pow(b, 2) + pow(c, 2)) * (int) (pow(a, 3) + pow(b, 3) + pow(c, 3));
        } else if  ((a == b && b != c) || (a != b && b == c) || (a != b && a == c)) {
            return (a + b + c) * (int) (pow(a, 2) + pow(b, 2) + pow(c, 2));
        }
        return (a + b + c);
    }
}