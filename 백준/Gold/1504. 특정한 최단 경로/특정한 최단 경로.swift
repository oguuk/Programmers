struct Queue<T> {
    
    private var input: [T] = []
    private var output: [T] = []
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
    
    mutating func push(of data: T) {
        input.append(data)
    }
}

let ne = readLine()!.split(separator: " ").map { Int($0)! }
var graph: [[(t: Int, c: Int)]] = Array(repeating: [], count: ne[0] + 1)
var answer: [Int] = [0, 0]

for _ in 0..<ne[1] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append((input[1], input[2]))
    graph[input[1]].append((input[0], input[2]))
}

let v: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let v1 = v[0], v2 = v[1]
let cases = [[1, v2, v1, ne[0]], [1, v1, v2, ne[0]]]

for (index, cas) in cases.enumerated() {
    for i in 0..<3 {
        let target = cas[i + 1]
        if cas[i] == target { continue }
        var costMap: [Int] = Array(repeating: Int.max, count: ne[0] + 1)
        var q = Queue<(t: Int, c: Int)>()
        graph[cas[i]].forEach { q.push(of: $0) }
        
        while !q.isEmpty {
            let (t, c) = q.pop()!
            if t == target  {
                if costMap[t] > c { costMap[t] = c }
                continue
            } else if costMap[t] < c {
                continue
            } else if costMap[t] > c {
                costMap[t] = c
            }
            graph[t].forEach { q.push(of: ($0.t, $0.c + c)) }
        }
        if costMap[target] == Int.max {
            answer.append(-1)
            break
        } else {
            answer[index] += costMap[target]
        }
    }
}
print(answer.min()! == 0 ? -1 : answer.min()!)