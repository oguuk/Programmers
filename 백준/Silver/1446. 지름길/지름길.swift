let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos: [[Int]] = []
var dp: [Int] = []
(0...input[1]).forEach { dp.append($0) }

for _ in 0..<input[0] {
    let roads = readLine()!.split(separator: " ").map { Int(String($0))! }
    infos.append(roads)
}

for i in 0...input[1] {
    if i > 0 {
        dp[i] = min(dp[i - 1] + 1, dp[i])
    }
    
    for info in infos {
        let (start, end, cost) = (info[0], info[1], info[2])
        if i == start, end <= input[1], dp[start] + cost < dp[end] {
            dp[end] = dp[start] + cost
        }
    }
}

print(dp.last!)
