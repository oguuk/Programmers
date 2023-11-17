let N = Int(readLine()!)!
let honey = readLine()!.split(separator: " ").map { Int($0)! }
let sum: Int = honey.reduce(0, +)
var answer: Int = 0

var subSum1: Int = sum - honey[0]
var subSum2: Int = sum - honey[N - 1]
var subSum3: Int = sum - honey[0] - honey[N - 1]

for i in 1..<N-1 {
    subSum1 -= honey[i]
    subSum2 -= honey[N - 1 - i]
    answer = max(answer, sum - honey[0] - honey[i] + subSum1) // hive 오른쪽
    answer = max(answer, sum - honey[N - 1] - honey[N - 1 - i] + subSum2) // hive 왼쪽
    answer = max(answer, subSum3 + honey[i]) // hive 중앙
}

print(answer)