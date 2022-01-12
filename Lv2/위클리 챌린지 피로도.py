from itertools import permutations as pm
def solution(k, dungeons):
    answer = []
    for a,b in enumerate(pm(dungeons,len(dungeons))):
        hit = 0
        score = k
        for j in b:
            if score >= j[0]:
                hit+=1
                score -=j[1]
        answer.append(hit)
    return max(answer)
