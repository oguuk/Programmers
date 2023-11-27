// 비용이 가장 적은 루트
let n: Int = Int(readLine()!)!
var routes: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var cityVisit: [Bool] = Array(repeating: false, count: n)
var visitedCities: [Int] = [0]
var answer: Int = Int.max

for i in 0..<n {
    routes.append([])
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    for (j, v) in input.enumerated() {
        routes[i][j] = v
    }
}

func solution(_ curr: Int, _ totalCost: Int) {
    
    if cityVisit[curr] { return }
    
    if visitedCities.count == n {
        let start = visitedCities.first!
        let backToStart = routes[curr][start]
        if backToStart == 0 { return }
        answer = min(answer, totalCost + backToStart)
        return
    }
    
    cityVisit[curr] = true
    
    for (to, cost) in routes[curr].enumerated() {
        if routes[curr][to] == 0 || cityVisit[to] { continue }
        visitedCities.append(to)
        solution(to, totalCost + cost)
        _=visitedCities.popLast()
        cityVisit[to] = false
    }
}

solution(0, 0)

print(answer)