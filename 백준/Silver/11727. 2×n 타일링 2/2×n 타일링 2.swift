let n = Int(readLine()!)!
var dp: [Int] = [0, 1, 3]
if n > 2 {
    for i in 3...n {
        dp.append((dp[i - 1] + dp[i - 2] * 2) % 10007)
    }
}

print(dp[n])

