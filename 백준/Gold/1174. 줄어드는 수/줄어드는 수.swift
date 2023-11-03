let N: Int = Int(readLine()!)!
var arr: [Int] = []
var temp: [Int] = []

func solution() {
    if !temp.isEmpty {
        let str = temp.map { String($0) }.joined()
        arr.append(Int(str)!)
    }
    for n in 0...9 {
        if !temp.isEmpty && temp.last! <= n { continue }
        temp.append(n)
        solution()
        _=temp.popLast()
    }
}

solution()
arr.sort()
if arr.count < N { print(-1) }
else { print(arr[N - 1]) }