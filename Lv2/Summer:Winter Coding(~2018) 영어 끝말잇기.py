import math
def solution(n, words):
    passed_words = [words[0]]
    for i in range(1,len(words)):
        if words[i][0] != words[i-1][-1] or words[i] in passed_words:
            return [(i+1)%n if (i+1)%n != 0 else n,math.ceil((i+1)/n)]
        passed_words.append(words[i])
    return [0,0]
