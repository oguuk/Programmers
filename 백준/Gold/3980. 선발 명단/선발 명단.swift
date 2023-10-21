let c = Int(readLine()!)!
var s: [[Int]] = []
var team: [Int] = []
var answer: [Int] = Array(repeating: 0, count: c)

func solution(_ position: Int, _ index: Int) {
    if position == 11 {
        var sum: Int = 0
        for (i, p) in team.enumerated() {
            if s[p][i] == 0 { return }
            sum += s[p][i]
        }
        answer[index] = max(answer[index], sum)
        return
    }
    
    for i in 0..<11 {
        if team.contains(i) || s[i][team.count] == 0 { continue }
        team.append(i)
        solution(position + 1, index)
        _=team.popLast()
    }
}

for a in 0..<c {
    for _ in 0..<11 {
        let info: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        s.append(info)
    }
    solution(0, a)
    s = []
}

for a in answer { print(a) }