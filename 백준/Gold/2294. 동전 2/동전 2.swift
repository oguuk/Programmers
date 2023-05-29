import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var coins: [Int] = []

for _ in 0..<nk[0] {
    coins.append(Int(readLine()!)!)
}

var dp: [Int] = Array(repeating: 10001, count: nk[1] + 1)
dp[0] = 0

for coin in coins {
    for i in stride(from: coin, through: nk[1], by: 1) {
        if dp[i] + dp[i - coin] >= Int(pow(2.0, 31.0)) {
            dp[i] = 0
        }
        if dp[i] > dp[i - coin] + 1 {
            dp[i] = dp[i - coin] + 1
        }
    }
}

print(dp.last! == 10001 ? -1 : dp.last!)