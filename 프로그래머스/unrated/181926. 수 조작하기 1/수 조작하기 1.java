class Solution {
    public int solution(int n, String control) {
        for(Character c: control.toCharArray()) {
            switch(c) {
                case 'w':
                    n += 1;
                    break;
                case 's':
                    n -= 1;
                    break;
                case 'd':
                    n += 10;
                    break;
                default:
                    n -= 10;
            }
        }
        return n;
    }
}