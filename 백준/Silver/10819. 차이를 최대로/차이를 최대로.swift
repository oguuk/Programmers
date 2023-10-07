let n: Int = Int(readLine()!)!
var input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var check: [Bool] = Array(repeating: false, count: n)
var arr: [Int] = []
var answer: Int = -Int.max

func solution() {
    if arr.count == n {
        var sum: Int = 0
        for i in 0..<(n-1) {
            sum += abs(arr[i] - arr[i + 1])
        }
        answer = max(answer, sum)
        return
    }
    
    for i in 0..<n {
        if check[i] { continue }
        check[i] = true
        arr.append(input[i])
        solution()
        _=arr.popLast()
        check[i] = false
    }
}

solution()
print(answer)
