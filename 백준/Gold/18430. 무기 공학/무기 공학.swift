let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var woods: [[Int]] = []
var check: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])
var answer: Int = 0

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    woods.append(input)
}

func calculate(_ edge: Int, _ side: Int, _ side2: Int) -> Int {
    return edge * 2 + side + side2
}

func solution(index: Int, sum: Int) {
    if index == nm[0] * nm[1] {
        answer = max(answer, sum)
        return
    }

    let y = index / nm[1]
    let x = index % nm[1]

    if !check[y][x] {
        let directions = [((0,1), (1,0)), ((1,0), (0,-1)), ((0,-1), (-1,0)), ((-1,0), (0,1))]
        for dir in directions {
            let (dy1, dx1) = dir.0
            let (dy2, dx2) = dir.1
            let newY1 = y + dy1
            let newX1 = x + dx1
            let newY2 = y + dy2
            let newX2 = x + dx2
            if newY1 >= 0 && newY1 < nm[0] && newX1 >= 0 && newX1 < nm[1] && newY2 >= 0 && newY2 < nm[0] && newX2 >= 0 && newX2 < nm[1] && !check[newY1][newX1] && !check[newY2][newX2] {
                check[y][x] = true
                check[newY1][newX1] = true
                check[newY2][newX2] = true
                solution(index: index + 1, sum: sum + calculate(woods[y][x], woods[newY1][newX1], woods[newY2][newX2]))
                check[y][x] = false
                check[newY1][newX1] = false
                check[newY2][newX2] = false
            }
        }
    }
    solution(index: index + 1, sum: sum)
}

solution(index: 0, sum: 0)
print(answer)