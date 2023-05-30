let firstString: String = readLine()!
let secondString: String = readLine()!
var dp: [Int] = Array(repeating: 0, count: secondString.count)

for (_, first) in firstString.enumerated() {
    var max = 0
    for (j, second) in secondString.enumerated() {
        if max < dp[j] {
            max = dp[j]
        } else if first == second {
            dp[j] = max + 1
        }
    }
}

print(dp.max()!)
