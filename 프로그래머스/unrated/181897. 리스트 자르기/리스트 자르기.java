import java.util.stream.*;

class Solution {
    public int[] solution(int n, int[] slicer, int[] num_list) {
        switch (n) {
            case 1: return IntStream.rangeClosed(0, slicer[1]).filter(i -> i < num_list.length).map(i -> num_list[i]).toArray();
            case 2: return IntStream.rangeClosed(slicer[0], num_list.length).filter(i -> i < num_list.length).map(i -> num_list[i]).toArray();
            case 3: return IntStream.rangeClosed(slicer[0], slicer[1]).filter(i -> i < num_list.length).map(i -> num_list[i]).toArray();
            default: return IntStream.iterate(slicer[0], i -> i <= slicer[1], i -> i + slicer[2]).filter(i -> i < num_list.length).map(i -> num_list[i]).toArray();
        }
    }
}