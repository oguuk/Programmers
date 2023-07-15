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

let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var cheese: [[Int]] = []
var cheeseSize = 0

for _ in 0..<nm[0] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    cheeseSize += input.filter { $0 == 1 }.count
    cheese.append(input)
}

var q = Queue<(r: Int, c: Int)>()
let directions: [[Int]] = [[1, 0], [-1, 0], [0, 1], [0, -1]]

for t in 0...cheeseSize {
    var melt: [(r: Int, c: Int)] = []
    var hitCount: [[Int]] = Array(repeating: Array(repeating: 0, count: nm[1]), count: nm[0])
    if cheeseSize == 0 {
        print(t)
        break
    }
    q.push(of: (0, 0))
    while !q.isEmpty {
        let (r, c) = q.pop()!
        if r < 0 || c < 0 || r >= nm[0] || c >= nm[1] || (cheese[r][c] == 0 && hitCount[r][c] > 0) { continue }
        hitCount[r][c] += 1
        if cheese[r][c] == 1 {
            if hitCount[r][c] > 1 && hitCount[r][c] < 3 {
                melt.append((r, c))
                cheeseSize -= 1
            }
        } else {
            for direction in directions {
                q.push(of: (r + direction[0], c + direction[1]))
            }
        }
    }
    melt.forEach { (r, c) in cheese[r][c] = 0 }
}