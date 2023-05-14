let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var stuff: [[Int]] = []

for _ in 0..<nk[0] {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    stuff.append(input)
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nk[1] + 1), count: nk[0])

for row in 0..<nk[0] {
    for col in 1...nk[1] {
        if row == 0 {
            if col >= stuff[row][0] {
                dp[row][col] = stuff[row][1]
            }
        } else {
            if col < stuff[row][0] {
                dp[row][col] = dp[row - 1][col]
            } else {
                dp[row][col] = max(dp[row - 1][col], stuff[row][1] + dp[row - 1][col - stuff[row][0]])
            }
        }
    }
}

print(dp[nk[0] - 1][nk[1]])

