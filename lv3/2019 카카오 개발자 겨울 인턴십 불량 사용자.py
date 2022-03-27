from collections import defaultdict as df
from itertools import combinations as cmb
answer = set()
def solution(user_id, banned_id):
    dic = df(list)
    numberOfCases = [[]for _ in range(len(banned_id))]
    for user in user_id:
        dic[len(user)].append(user)
    for idx1, banID in enumerate(banned_id):
        for ID in dic[len(banID)]:
            for idx2, char in enumerate(banID):
                if char != ID[idx2] and char != '*':
                    break
                if idx2 == len(banID)-1:
                    numberOfCases[idx1].append(ID)
    bfs(numberOfCases,0,set())
    return len(answer)

def bfs(numberOfCases,num,case):
    global answer
    if num == len(numberOfCases):
        if len(case) == len(numberOfCases):
            case = sorted(list(case))
            answer.add(tuple(case))
        return
    for ID in numberOfCases[num]:
        bfs(numberOfCases,num+1,case|{ID})
