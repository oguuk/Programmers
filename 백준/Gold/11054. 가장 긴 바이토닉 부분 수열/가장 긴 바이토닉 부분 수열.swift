let n = Int(readLine()!)!
let list = [0] + readLine()!.split(separator: " ").map { Int(String($0))! } + [0]
var answer = 0
var LIS = Array(repeating: 0, count: n + 2)
var LISR = Array(repeating: 0, count: n + 2)

for i in 1..<n+1 {
    for j in 0..<i {
        if list[j] < list[i] { LIS[i] = max(LIS[i], LIS[j] + 1) }
    }
}

for i in stride(from: n, through: 0, by: -1) {
    for j in stride(from: n + 1, through: i, by: -1) {
        if list[i] > list[j] { LISR[i] = max(LISR[i], LISR[j] + 1) }
    }
}

for i in 1..<n+1 {
    answer = max(answer, LIS[i] + LISR[i])
}

print(answer - 1)