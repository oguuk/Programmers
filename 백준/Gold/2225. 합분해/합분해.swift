let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: input[0]), count: input[1])

dp[0] = Array(repeating: 1, count: input[0])

for i in 1..<input[1] {
    var temp: [Int] = [i + 1]
    
    for j in 1..<input[0] {
        let num = (dp[i - 1][j] + temp[j - 1]) % 1000000000
        temp.append(num)
    }
    dp[i] = temp
}

print(dp[input[1] - 1][input[0] - 1])
