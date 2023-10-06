var answer: (r: Int, c: Int) = (Int.max, Int.max)
var board: [[Int]] = []

for _ in 0..<19 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

func checkDown(_ color: Int, _ r: Int, _ c: Int) -> Bool {
    var bingo: Int = 1
    
    for i in 1...5 {
        let down = r + i
        if down >= 19 || board[down][c] != color { break }
        bingo += 1
    }
    
    return bingo == 5
}

func checkRight(_ color: Int, _ r: Int, _ c: Int) -> Bool {
    var bingo: Int = 1
    
    for i in 1...5 {
        let col = c + i
        if col >= 19 || board[r][col] != color { break }
        if r == 10 && c == 9 { print(bingo) }
        bingo += 1
    }
    
    return bingo == 5
}

func checkUpRight(_ color: Int, _ r: Int, _ c: Int) -> Bool {
    var bingo: Int = 1
    
    for i in 1...5 {
        let row = r - i, col = c + i
        if row < 0 || col >= 19 || board[row][col] != color { break }
        bingo += 1
    }
    
    return bingo == 5
}

func checkDownRight(_ color: Int, _ r: Int, _ c: Int) -> Bool {
    var bingo: Int = 1
    
    for i in 1...5 {
        let row = r + i, col = c + i
        if row >= 19 || col >= 19 || board[row][col] != color { break }
        bingo += 1
    }
    
    return bingo == 5
}

func solution() {
    for c in 0..<19 {
        for r in 0..<19 {
            let color = board[r][c]
            if color == 0 { continue }
            if checkDown(color, r, c) {
                if r > 0 && board[r - 1][c] == color { continue }
                print(color)
                print(r + 1, c + 1)
                return
            } else if checkRight(color, r, c) {
                if c > 0 && board[r][c - 1] == color { continue }
                print(color)
                print(r + 1, c + 1)
                return
            } else if checkDownRight(color, r, c) {
                if r > 0 && c > 0 && board[r - 1][c - 1] == color { continue }
                print(color)
                print(r + 1, c + 1)
                return
            } else if checkUpRight(color, r, c) {
                if r < 18 && c > 0 && board[r + 1][c - 1] == color { continue }
                print(color)
                print(r + 1, c + 1)
                return
            }
            
        }
    }
    print(0)
}

solution()
