struct Queue<T> {
    
    private var input: [T] = []
    private var output: [T] = []
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func push(of data: T) {
        input.append(data)
    }
    
    mutating func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var front: [Int : [Int]] = [:]
var graph: [[Int]] = Array(repeating: [], count: nm[0])
var indegree: [Int] = Array(repeating: 0, count: nm[0])
var queue: Queue<Int> = Queue()
var answer: [String] = []

for _ in 0..<nm[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0] - 1].append(input[1] - 1)
    indegree[input[1] - 1] += 1
}

for n in 0..<nm[0] {
    if indegree[n] == 0 { queue.push(of: n) }
}

while !queue.isEmpty {
    var curr = queue.pop()!
    answer.append("\(curr + 1)")
    
    for n in graph[curr] {
        indegree[n] -= 1
        if indegree[n] == 0 {
            queue.push(of: n)
        }
    }
}

print(answer.joined(separator: " "))