
from collections import defaultdict
def solution(gems):
    gemsBox = defaultdict(int)
    for gem in gems: gemsBox[gem] = 0
    answer = []
    collect = set()
    end = 0
    for start in range(len(gems)):
        if end > start:
            if start < len(gems)-1 and gems[start] == gems[start+1]:
                gemsBox[gems[start]] -=1
                continue
        while (satisfy:= len(collect) < len(gemsBox)) and end < len(gems):
            collect.add(gems[end])
            gemsBox[gems[end]] +=1
            end +=1
        if not satisfy:
            answer.append([start+1,end+1])
            gemsBox[gems[start]] -=1
            if gemsBox[gems[start]] == 0:
                collect.remove(gems[start])
    answer.sort(key = lambda x:(x[1]-x[0],x[0]))
    return answer[0][0],answer[0][1]-1
