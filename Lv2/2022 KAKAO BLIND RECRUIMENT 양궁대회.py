from itertools import combinations_with_replacement as cwr
def solution(n, info):
    info = {10-i:info[i] for i in range(11)}
    answer, big = [], 0
    lion = {i:0 for i in range(11)}
    for i in cwr(lion.keys(),n):
        a,l_score,a_score = check(i,info)
        if a:
            if big < l_score - a_score:
                answer.clear()
                answer.append(list(a.values()))
                big = l_score - a_score
            elif big == l_score - a_score:
                answer.append(list(a.values()))
    answer.sort(key = lambda x:(x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],x[8]))
    return answer[-1][::-1] if answer else [-1]

def check(cwr,info):
    lion = {i:0 for i in range(11)}
    l_score, a_score = 0, 0
    for i in cwr:
        if lion.get(i):
            lion[i] += 1
        else:
            lion[i] = 1
    for i in range(11):
        if lion[i] > info[i]:
            l_score += i
        else:
            if info[i]:
                a_score += i
    return (lion,l_score,a_score) if l_score > a_score else (False,0,0)
