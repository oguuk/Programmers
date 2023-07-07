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

let rc = readLine()!.split(separator: " ").map { Int($0)! }
var map: [[Int]] = []

for _ in 0..<rc[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}
var answer: [Int] = []

while true {
    var isVisit: [[Bool]] = Array(repeating: Array(repeating: false, count: rc[1]), count: rc[0])
    var cheeseCountBeforeEnd: Int = 0
    var q = Queue<(r: Int, c: Int)>()
    q.push(of: (0, 0))
    while !q.isEmpty {
        let (r, c) = q.pop()!
        if r < 0 || c < 0 || r >= rc[0] || c >= rc[1] ||  isVisit[r][c] { continue }
        isVisit[r][c] = true
        if map[r][c] == 1 {
            cheeseCountBeforeEnd += 1
            map[r][c] = 0
            continue
        }
        
        for d in [[1, 0], [0, 1], [-1, 0], [0, -1]] {
            let newR = r + d[0], newC = c + d[1]
            q.push(of: (newR, newC))
        }
    }

    if cheeseCountBeforeEnd == 0 { break }
    else { answer.append(cheeseCountBeforeEnd) }
}

print(answer.count,"\n\(answer[answer.count - 1])")