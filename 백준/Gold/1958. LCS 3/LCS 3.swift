let firstStr = [""] + readLine()!.map { String($0) }
let secondStr = [""] + readLine()!.map { String($0) }
let thirdStr = [""] + readLine()!.map { String($0) }
var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0,
                                                            count: 101),
                                           count: 101),
                          count: 101)

func max(_ a: Int, _ b: Int, _ c: Int) -> Int {
    return max(max(a, b), c)
}

for f in 1..<firstStr.count {
    for s in 1..<secondStr.count {
        for t in 1..<thirdStr.count {
            if firstStr[f] == secondStr[s] && secondStr[s] == thirdStr[t] {
                dp[f][s][t] = dp[f - 1][s - 1][t - 1] + 1
            } else {
                dp[f][s][t] = max(dp[f - 1][s][t], dp[f][s - 1][t], dp[f][s][t - 1])
            }
        }
    }
}

print(dp[firstStr.count - 1][secondStr.count - 1][thirdStr.count - 1])
