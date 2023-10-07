let n = Int(readLine()!)!
var arr: [Int] = []

func solution() {
    if arr.count == n {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if arr.contains(i) { continue }
        arr.append(i)
        solution()
        _ = arr.popLast()
    }
}
solution()