let n: Int = Int(readLine()!)!
var infos: [[Int]] = []
var answer: Int = Int.max
var cases: [[Int]] = []
var arr: [Int] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    infos.append(input)
}

func getCase() {
    let start = arr.isEmpty ? -1: arr.last!
    if start == n { return }
    
    if arr.count == n / 2 {
        cases.append(arr)
        return
    }
    for i in (start+1)..<n {
        arr.append(i)
        getCase()
        _ = arr.popLast()
    }
}

getCase()

for c in cases {
    let other = Array(0..<n).filter { !c.contains($0) }
    var score1 = 0
    var score2 = 0
    
    for i in c {
        for j in c {
            if i == j { continue }
            score1 += infos[i][j]
        }
    }
    
    for i in other {
        for j in other {
            score2 += infos[i][j]
        }
    }
    answer = min(answer, abs(score2 - score1))
}
print(answer)