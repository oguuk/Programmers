let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var paper: [[Int]] = []
var answer: Int = 0

for _ in 0..<nm[0] {
    let input: [Int] = readLine()!.map { Int(String($0))! }
    paper.append(input)
}

func calculateSum(with cuts: [[Bool]]) -> Int {
    var totalSum = 0

    // 가로로 자른 숫자들의 합 계산
    for r in 0..<nm[0] {
        var numStr = ""
        for c in 0..<nm[1] {
            if cuts[r][c] {
                numStr += String(paper[r][c])
            } else {
                totalSum += Int(numStr) ?? 0
                numStr = ""
            }
        }
        totalSum += Int(numStr) ?? 0
    }

    // 세로로 자른 숫자들의 합 계산
    for c in 0..<nm[1] {
        var numStr = ""
        for r in 0..<nm[0] {
            if !cuts[r][c] {
                numStr += String(paper[r][c])
            } else {
                totalSum += Int(numStr) ?? 0
                numStr = ""
            }
        }
        totalSum += Int(numStr) ?? 0
    }

    return totalSum
}

// 재귀 함수를 통해 모든 경우의 수를 탐색
func solution(_ r: Int, _ c: Int, _ cuts: [[Bool]]) {
    if r == nm[0] {
        // 모든 칸에 대한 결정이 끝나면 합을 계산
        answer = max(answer, calculateSum(with: cuts))
        return
    }

    var newCuts = cuts
    var newR = r
    var newC = c + 1
    
    if c == nm[1] - 1 {
        newR += 1
        newC = 0
    }
    
    // 현재 칸을 가로로 자르는 경우
    newCuts[r][c] = true
    solution(newR, newC, newCuts)

    // 현재 칸을 세로로 자르는 경우
    newCuts[r][c] = false
    solution(newR, newC, newCuts)
}

// 초기 상태에서 가로로 자른 것을 true, 세로로 자른 것을 false로 설정
var initialCuts = Array(repeating: Array(repeating: true, count: nm[1]), count: nm[0])
solution(0, 0, initialCuts)
print(answer)