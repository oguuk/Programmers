class Solution {
    public int solution(String[] babbling) {
        int count = 0; 
        String[] syllables = {"aya", "ye", "woo", "ma"};

        for (String word : babbling) {
            String tempWord = word;
            for (String syllable : syllables) {
                if (tempWord.contains(syllable)) {
                    tempWord = tempWord.replace(syllable, "@");
                }
            }
            if (tempWord.replaceAll("@", "").isEmpty()) {
                count++;
            }
        }
        return count;
    }
}