let n = Int(readLine()!)!
let a: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.reversed()
var stack: [Int] = []
var answer: [Int] = []

for v in a {
    
    while !stack.isEmpty {
        let last = stack.removeLast()
        if last > v {
            answer.append(last)
            [last, v].forEach { stack.append($0) }
            break
        }
    }
    
    if stack.isEmpty {
        answer.append(-1)
        stack.append(v)
    }
}

print(answer.map { String($0) }.reversed().joined(separator: " "))