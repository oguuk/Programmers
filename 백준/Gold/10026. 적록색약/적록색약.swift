class Queue<T> {
    var input: [T] = []
    var output: [T] = []
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
    
    func push(of: T) {
        input.append(of)
    }
}

let N: Int = Int(readLine()!)!
let directions: [[Int]] = [[1, 0], [0, 1], [-1, 0], [0, -1]]
var normal: [[Int]] = [] // R = 1, G = 2, B = 3
var colorBlind: [[Int]] = []
var answer: [Int] = [0, 0]

for _ in 0..<N {
    var n: [Int] = [], b: [Int] = []
    readLine()!.forEach {
        if $0 == "R" {
            n.append(1)
            b.append(1)
        } else if $0 == "G" {
            n.append(2)
            b.append(1)
        } else {
            n.append(3)
            b.append(3)
        }
    }
    normal.append(n)
    colorBlind.append(b)
}

for turn in 0..<2 {
    var isVisit: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    let whosTurn = turn == 0 ? normal : colorBlind
    let queue = Queue<[Int]>()
    for row in 0..<N {
        for col in 0..<N {
            if isVisit[row][col] { continue }
            queue.push(of: [row, col])
            while !queue.isEmpty {
                let position = queue.pop()!
                if position[0] < 0 || position[1] < 0 || position[0] >= N || position[1] >= N || isVisit[position[0]][position[1]] { continue }
                
                if whosTurn[row][col] == whosTurn[position[0]][position[1]] {
                    isVisit[position[0]][position[1]] = true
                    for direction in directions {
                        queue.push(of: [position[0] + direction[0], position[1] + direction[1]])
                    }
                }
            }
            answer[turn] += 1
        }
    }
}

print(answer[0], answer[1])
