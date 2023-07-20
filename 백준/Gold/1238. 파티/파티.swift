struct Queue<T> {
    
    private var input: [T] = []
    private var output: [T] = []
    var count: Int { return input.count + output.count }
    var isEmpty: Bool {
        return input.isEmpty&&output.isEmpty
    }
    
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

let nmx: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var road: [[(t: Int, c: Int)]] = Array(repeating: [], count: nmx[0] + 1)
var costToX: [Int] = Array(repeating: Int.max, count: nmx[0] + 1)
var costToTownFromX: [Int] = []
var answer: [Int] = Array(repeating: 0, count: nmx[0] + 1)
costToX[nmx[2]] = 0

for _ in 0..<nmx[1] {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    road[info[0]].append((info[1], info[2]))
}

for student in 1...nmx[0] {
    var q = Queue<(t: Int, c: Int)>()
    road[student].forEach { q.push($0) }
    var costToTown = Array(repeating: Int.max, count: nmx[0] + 1)
    while !q.isEmpty {
        let (t, c) = q.pop()!
        if t == nmx[2] {
            if costToTown[t] > c { costToTown[t] = c }
            continue
        }
        if costToTown[t] < c { continue }
        else { costToTown[t] = c }
        for next in road[t] {
            q.push((next.t, c + next.c))
        }
    }
    if student == nmx[2] {
        costToTownFromX = costToTown
    } else {
        costToX[student] = costToTown[nmx[2]]
    }
}
for i in 1...nmx[0] {
    answer[i] = costToX[i] + costToTownFromX[i]
}

print(answer.max()!)