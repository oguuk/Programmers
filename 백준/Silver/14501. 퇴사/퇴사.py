N = int(input())
arr = []
dp = [0] * (N+1)

for _ in range(N):
    t, p = map(int, input().split())
    arr.append((t, p))

for i in range(N):
    # 현재 날짜의 상담이 끝나는 날이 N일을 넘지 않는 경우
    if i + arr[i][0] <= N:
        # 현재 날짜의 상담을 선택한 경우의 수익을 계산
        dp[i + arr[i][0]] = max(dp[i + arr[i][0]], dp[i] + arr[i][1])
    
    # 다음날의 수익은 현재날짜의 수익과 비교하여 큰 것을 선택
    dp[i+1] = max(dp[i+1], dp[i])

print(dp[N])
