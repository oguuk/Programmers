let nm = readLine()!.split(separator: " ").map { Int($0)! }
var board: [[Int]] = []
var answer: [Int] = []
var cases: [[[Int]]] = [[], []]

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.map { $0 == "W" ? 1 : 0 }
    board.append(input)
}

for i in 0..<2 {
    var b: [Int] = [0, 1, 0, 1, 0, 1, 0, 1]
    if i == 0 { b = [1, 0, 1, 0, 1, 0, 1, 0] }
    for _ in 0..<8 {
        cases[i].append(b)
        b = b.map { $0 == 0 ? 1 : 0 }
    }
}

for i in 0..<2 {
    for r in 0...(nm[0] - 8) {
        for c in 0...(nm[1] - 8) {
            var draw = 0
            for rp in 0..<8 {
                let caseSlice = cases[i][rp]
                let slice = board[r + rp][c..<c+8]
                let count = zip(caseSlice, slice).filter { $0.0 != $0.1 }
                draw += count.count
            }
            answer.append(draw)
        }
    }
}

print(answer.min()!)