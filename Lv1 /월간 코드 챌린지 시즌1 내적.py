def solution(a, b):
    answer = 0
    for i,j in enumerate(a):
        answer += b[i]*j
    return answer
