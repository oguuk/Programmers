def solution(n):
    return repeat(n,1)

def repeat(n,answer):
    if n-1 < 0 or n-2 < 0:
        return answer+1
    return repeat(n-1,answer+1),repeat(n-2,answer+1)
