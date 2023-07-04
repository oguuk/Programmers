let n = Int(readLine()!)!
var dp: [Int] = [0, 0, 3, 0]
if n > 3 {
    for i in 4...n {
        if i % 2 != 0 {
            dp.append(0)
        } else {
            var temp = 2 + dp[i - 2] * 3
            for j in stride(from: 0, through: i - 4, by: 2) {
                temp += dp[j] * 2
            }
            dp.append(temp)
        }
    }
}

print(dp[n])