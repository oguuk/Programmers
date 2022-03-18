import sys; sys.setrecursionlimit(100000)
def solution(stones, k):
    global stone,K
    stone,K = stones,k
    if k == 1:
        return min(stones)
    start = 1
    end = max(stones)
    while(start < end -1):
        mid = (start+end)//2
        if cross(mid):
            start = mid
        else:
            end = mid
    return start-1

def cross(now):
    global stone,K
    stone[now] -= 1
    for plus in range(1,K+2):
        if plus == K+1:
            return False
        if now+plus >= len(stone):
            return True
        if stone[now+plus]:
            return cross(now+plus)
