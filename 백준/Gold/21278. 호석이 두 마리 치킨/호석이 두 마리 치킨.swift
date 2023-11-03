struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func push(_ data: T) {
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

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var buildings: [[Int]] = Array(repeating: [Int](), count: nm[0] + 1)
var cost: [[Int]] = Array(repeating: [], count: nm[0] + 1)
var answer: [Int] = [Int.max, Int.max, Int.max]

for _ in 0..<nm[1] {
    let info: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    buildings[info[0]].append(info[1])
    buildings[info[1]].append(info[0])
}

for i in 1...nm[0] {
    var isVisit: [Int] = Array(repeating: Int.max, count: nm[0] + 1)

    var q = Queue<(cu: Int, co: Int)>()
    q.push((i, 0))
    
    while !q.isEmpty {
        let (cu, co) = q.pop()!
        
        let next: [Int] = buildings[cu]
        if isVisit[cu] <= co { continue }
        isVisit[cu] = co
        
        for n in next {
            q.push((n, co + 1))
        }
    }
    cost[i] = isVisit
}

for i in 1...nm[0] {
    for j in 1...nm[0] {
        if i == j { continue }
        var minimum: Int = 0
        for k in 1...nm[0] {
            if k == i || k == j { continue }
            minimum += min(cost[k][i], cost[k][j])
        }
        minimum *= 2
        if answer[2] > minimum {
            answer = [i, j, minimum]
        } else if answer[2] == minimum {
            if answer[0] > i {
                answer = [i, j, minimum]
            } else if answer[0] == i {
                if answer[1] > j {
                    answer = [i, j, minimum]
                }
            }
        }
    }
}

print(answer.map { String($0) }.joined(separator: " "))