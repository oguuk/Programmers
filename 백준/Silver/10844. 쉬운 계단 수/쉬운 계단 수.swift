let MOD = 1000000000
let N = Int(readLine()!)!
var dp: [[Int]] = [[], (0...9).map { $0 == 0 ? 0 : 1 }]

if N >= 2 {
    for n in 2...N {
        var newDP: [Int] = (0...9).map { _ in 0 }
        for i in 0...9 {
            if i == 0 {
                newDP[i] = dp[n - 1][1] % MOD
            } else if i == 9 {
                newDP[i] = dp[n - 1][8] % MOD
            } else {
                newDP[i] = (dp[n - 1][i - 1] + dp[n - 1][i + 1]) % MOD
            }
        }
        dp.append(newDP)
    }
}

print(dp.last!.reduce(0, +) % MOD)
