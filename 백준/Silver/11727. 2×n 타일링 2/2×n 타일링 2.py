n = int(input())
dp = [1, 3]
if n < 2:
    print(dp[n - 1])
else:
    for i in range(2,n + 1):
        dp.append(dp[i - 1] + dp[i - 2] * 2)
   
    print(dp[n - 1] % 10007)