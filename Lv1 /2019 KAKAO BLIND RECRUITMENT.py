from collections import Counter as cnt

def solution(N, stages):
    dic = cnt(stages)
    result = []
    people = len(stages)
    if N+1 in stages:
        del dic[N+1]
    dic = sorted(dic.items())
    zero_values = [i for i in range(1,N+1)]
    for i in dic:
        if i[0] in zero_values:
            zero_values.remove(i[0])
        result.append([i[1]/people,i[0]])
        people -= i[1]
    result.sort(key = lambda x:-x[0])
    zero_values.sort()
    answer = [i[1] for i in result] + zero_values
    
    return answer
