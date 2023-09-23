let nm = readLine()!.split(separator: " ").map { Int($0)! }
var arr: [Int] = []

func solution() {
    if arr.count == nm[1] {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...nm[0] {
        if let last = arr.last, last > i { continue }
        arr.append(i)
        solution()
        arr.popLast()
    }
}

solution()