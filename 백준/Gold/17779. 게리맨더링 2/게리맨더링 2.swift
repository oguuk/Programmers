var board: [[Int]] = []
var total: Int = 0
let N = Int(readLine()!)!
var answer = Int.max

for _ in 0..<N {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    total += input.reduce(0, +)
    board.append(input)
}

func first(_ row: Int, _ col: Int, _ d1: Int, _ d2: Int) -> Int {
    var sum: Int = 0
    var c = col
    
    for r in 0..<(row + d1) {
        if r >= row { c -= 1 }
        sum += board[r][...c].reduce(0, +)
    }
    
    return sum
}

func second(_ row: Int, _ col: Int, _ d1: Int, _ d2: Int) -> Int {
    var sum: Int = 0
    var c = col + 1
    
    for r in 0...(row + d2) {
        if r > row { c += 1 }
        sum += board[r][c...].reduce(0, +)
    }
    
    return sum
}

func third(_ row: Int, _ col: Int, _ d1: Int, _ d2: Int) -> Int {
    var sum: Int = 0
    var c = col
    
    for r in row..<N {
        sum += board[r][..<c].reduce(0, +)
        if r < row + d2 { c += 1 }
    }
    return sum
}

func fourth(_ row: Int, _ col: Int, _ d1: Int, _ d2: Int) -> Int {
    var sum: Int = 0
    var c = col
    
    for r in (row + 1)..<N {
        sum += board[r][c...].reduce(0, +)
        if r <= row + d1 { c -= 1 }
    }
    
    return sum
}

func solution() {
    for r in 0..<N-2 {
        for c in 1..<N-1 {
            for d1 in 1..<N-2 {
                for d2 in 1..<N-2 {
                    if r + d1 >= N - 1 || r + d2 >= N - 1 || r + d1 + d2 >= N { break }
                    if c - d1 < 0 || c + d2 >= N || c - d1 + d2 < 0 || c - d1 + d2 >= N { break }
                    
                    let one = first(r, c, d1, d2)
                    let two = second(r, c, d1, d2)
                    let three = third(r + d1, c - d1, d1, d2)
                    let four = fourth(r + d2, c + d2, d1, d2)
                    let five = total - (one + two + three + four)
                    let regions = [one, two, three, four, five]
                    
                    answer = min(answer, abs(regions.min()! - regions.max()!))
                }
            }
        }
    }
}

solution()
print(answer)