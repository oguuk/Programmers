import collections as c

def solution(clothes):
    answer = 1
    arr = []
    for i in clothes:
        arr.append(i[1])
    dic = c.Counter(arr)
    values = list(dic.values())
    
    for v in values:
        answer *= v + 1
        
    return answer-1
