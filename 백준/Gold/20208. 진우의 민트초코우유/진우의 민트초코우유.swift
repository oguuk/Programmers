var answer: Int = 0
let NMH = readLine()!.split(separator: " ").map { Int($0)! }
let n = NMH[0]
var life = NMH[1]
let gain = NMH[2]
var home: (r: Int, c: Int) = (0, 0)
var board: [[Int]] = []
var milks: [(r: Int, c: Int)] = []
var visit: [Bool] = Array(repeating: false, count: 12)

for i in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<n {
        if info[j] == 1 { home = (i, j) }
        else if info[j] == 2 { milks.append((i, j)) }
    }
    board.append(info)
}

func solution(_ curr: (r: Int, c: Int), _ life: Int, _ milk: Int) {
    if life >= abs(curr.r - home.r) + abs(curr.c - home.c) { answer = max(answer, milk) }
    for i in 0..<milks.count {
        if visit[i] { continue }
        visit[i] = true
        let dist = abs(curr.r - milks[i].r) + abs(curr.c - milks[i].c)
        if life - dist >= 0 {
            solution(milks[i], life - dist + gain, milk + 1)
        }
        visit[i] = false
    }
}

solution(home, life, 0)
print(answer)