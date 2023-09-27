let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var ns: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr: [Int] = []

func solution() {
    
    if arr.count == nm[1] {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<nm[0] {
        if arr.contains(ns[i]) { continue }
        arr.append(ns[i])
        solution()
        arr.popLast()
    }
}

solution()