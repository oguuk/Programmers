let ns: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var temp: [Int] = []
var answer: Int = 0

func solution(_ index: Int) {
    
    if !temp.isEmpty {
        let sum = temp.reduce(0, +)
        if sum == ns[1] {
            answer += 1
        }
    }
    if index >= ns[0] { return }
    for i in index..<ns[0] {
        temp.append(arr[i])
        solution(i + 1)
        _=temp.popLast()
    }
}

solution(0)

print(answer)