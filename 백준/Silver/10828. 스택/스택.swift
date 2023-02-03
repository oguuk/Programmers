var stack: [Int] = []
var answer: [Int] = []

for _ in 0..<Int(readLine()!)! {
    let order = readLine()!.split(separator: " ")
    switch order[0] {
        case "push":
            stack.append(Int(String(order[1]))!)
        case "pop":
            answer.append(stack.count > 0 ? stack.popLast()! : -1)
        case "size":
            answer.append(stack.count)
        case "empty":
            answer.append(stack.count == 0 ? 1 : 0)
        default:
            answer.append(stack.count > 0 ? stack.last! : -1)
    }
}
answer.forEach { print($0) }