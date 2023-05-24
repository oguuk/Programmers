import Foundation

let nk: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var nums: [Int] = []

for _ in 0..<nk[0] {
    nums.append(Int(readLine()!)!)
}

var dp: [Int] = Array(repeating: 0, count: nk[1] + 1)
dp[0] = 1

for num in nums {
    for i in stride(from: num, through: nk[1], by: 1) {
        if dp[i] + dp[i-num] >= Int(pow(2.0, 31.0)) {
            dp[i] = 0
        }
        dp[i] += dp[i - num]
    }
}

print(dp[nk[1]])