N, K = map(int, input().split())
A = list(map(int, input().split()))
use = [False for _ in range(N)]
answer = 0

def solution(weight, count):
    global answer
    
    if weight < 500: return
        
    if count == N:
        answer += 1
        return
        
    for i in range(N):
        if use[i]: continue
        use[i] = True
        solution(weight + A[i] - K, count + 1)
        use[i] = False

solution(500,0)
print(answer)