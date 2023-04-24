let N = Int(readLine()!)!
var dp: [Int] = [1, 1]

if N > 2 {
    for i in 3...N {
        dp.append(dp[i - 2] + dp[i - 3])
    }
}
print(dp[N - 1])