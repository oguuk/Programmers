struct Queue<T> {
    
    private var input: [T] = []
    private var output: [T] = []
    var isEmpty: Bool { return input.isEmpty && output.isEmpty }
    
    mutating func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
    
    mutating func push(_ data: T) {
        input.append(data)
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let directions: [[Int]] = [[1, 0], [-1, 0], [0, 1], [0, -1]]
var map: [[Int]] = []
var costMap: [[[Int]]] = []
var q = Queue<(r: Int, c: Int, chance: Int, cost: Int)>()
var answer = Int.max

for i in 0..<nm[0] {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
    costMap.append([input.map { _ in Int.max }])
    costMap[i].append(input.map { _ in Int.max })
}

q.push((0, 0, 1, 1))

while !q.isEmpty {
    let (row, col, chance, cost) = q.pop()!
    if row == nm[0] - 1 && col == nm[1] - 1 {
        if costMap[row][chance][col] > cost { answer = cost }
        break
    }
    if row < 0 || row >= nm[0] || col < 0 || col >= nm[1] || costMap[row][chance][col] <= cost { continue }
    var newChance = chance
    if map[row][col] == 1 {
        if chance == 1 { newChance = 0 }
        else { continue }
    }
    costMap[row][newChance][col] = cost
    for d in directions {
        let newR = row + d[0], newC = col + d[1]
        q.push((newR, newC, newChance, cost + 1))
    }
}
print(answer == Int.max ? -1 : answer)