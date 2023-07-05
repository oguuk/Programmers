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

class Snake {
    
    var head: (r: Int, c: Int) = (1, 1)
    var body: Queue<(r: Int, c: Int)> = Queue()
    var length: Int = 1
    var direction: Int = 1 // 0부터 시계방향
}

var snake = Snake()
snake.body.push(of: (1, 1))
var snakeDirections: [(x: Int, c: String)] = []
let n = Int(readLine()!)!
let k = Int(readLine()!)!

// 0 불가능 1 가능 2 사과
var board: [[Int]] = []
for i in 0..<n+2 {
    if i == 0 || i == n + 1 { board.append([Int](repeating: 0, count: n + 2))}
    else { board.append([0] + [Int](repeating: 1, count: n) + [0]) }
}
board[1][1] = 0

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board[input[0]][input[1]] = 2
}

let l = Int(readLine()!)!

for _ in 0..<l {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    snakeDirections.append((Int(input[0])!, input[1]))
}

snakeDirections = snakeDirections.reversed()

for time in 1...Int.max {
    var r = snake.head.r, c = snake.head.c
    
    switch snake.direction {
    case 0: r -= 1
    case 1: c += 1
    case 2: r += 1
    default: c -= 1
    }

    if board[r][c] > 0 {
        if board[r][c] != 2 {
            let tail = snake.body.pop()!
            board[tail.r][tail.c] = 1
        }
        board[r][c] = 0
        snake.head = (r, c)
        snake.body.push(of: snake.head)
    } else {
        print(time)
        break
    }
    
    if let d = snakeDirections.last, time == d.x {
        snakeDirections.popLast()
        switch d.c {
        case "L": // 반시계
            snake.direction = snake.direction == 0 ? 3 : snake.direction - 1
        default: // 시계
            snake.direction = snake.direction == 3 ? 0 : snake.direction + 1
        }
    }
}