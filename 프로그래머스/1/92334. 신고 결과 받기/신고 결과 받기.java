import java.util.*;

class Solution {
    public int[] solution(String[] id_list, String[] report, int k) {
        int[] answer = new int[id_list.length];
        Map<String, ArrayList<String>> reporter = new HashMap<>();
        Map<String, Integer> reported = new HashMap<>();
        
        for (String entry : report) {
            String[] parts = entry.split(" ");
            
            if (parts.length == 2) {
                String reporterName = parts[0];
                String reportedName = parts[1];
                
                if (!reporter.containsKey(reporterName)) {
                    reporter.put(reporterName, new ArrayList<String>());
                }
                
                if (!reporter.get(reporterName).contains(reportedName)) {
                    reporter.get(reporterName).add(reportedName);
                    reported.put(reportedName, reported.getOrDefault(reportedName, 0) + 1); 
                }
            }
        }

        for (int i = 0; i < id_list.length; i++) {
            String id = id_list[i];
            if (!reporter.containsKey(id)) continue;
            for (String reportedName : reporter.get(id)) {
                if (reported.get(reportedName) >= k) answer[i] += 1;
            }
        }

        return answer;
    }
}
