let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var answer = Array(repeating: 1, count: N)

for i in 1..<N {
    for j in 0..<i {
        if A[i] > A[j] {
            if answer[i] < answer[j] + 1 { answer[i] = answer[j] + 1 }
        }
    }
}

print(answer.max()!)
