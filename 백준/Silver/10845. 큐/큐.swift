class que {
    
    private var input: [Int] = []
    private var output: [Int] = []
    
    func push(_ num: Int) {
        input.append(num)
    }
    
    func pop() -> Int? {
        if output.isEmpty {
            while !input.isEmpty {
                output.append(input.popLast()!)
            }
        }
        return output.popLast()
    }
    
    func size() -> Int {
        return input.count + output.count
    }
    
    func front() -> Int? {
        let num = pop()
        if let num = num {
            output.append(num)
        }
        return num
    }
    
    func back() -> Int? {
        if let last = input.last {
            return input.last
        } 
        return output.first
    }
}

var queue = que()
var answer: [Int] = []

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    
    switch input[0] {
        case "push":
            queue.push(Int(String(input[1]))!)
        case "pop":
            let num = queue.pop() ?? -1
            answer.append(num)
        case "size":
            answer.append(queue.size())
        case "empty":
            answer.append(queue.size() == 0 ? 1 : 0)
        case "front":
            answer.append(queue.front() ?? -1)
        default:
            answer.append(queue.back() ?? -1)
    }
}

answer.forEach { print($0) }