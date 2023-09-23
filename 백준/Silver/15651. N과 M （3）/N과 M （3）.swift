let nm = readLine()!.split(separator: " ").map { Int($0)! }
var arr: [Int] = []
var output: [String] = []

func solution() {
    if arr.count == nm[1] {
        output.append(arr.map(String.init).joined(separator: " "))
        return
    }
    
    for i in 1...nm[0] {
        arr.append(i)
        solution()
        arr.popLast()
    }
}

solution()
print(output.joined(separator: "\n"))