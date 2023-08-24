let nl = readLine()!.split(separator: " ").map { Int($0)! }
var map: [[Int]] = []
var answer: Int = 0

for _ in 0..<nl[0] {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

for i in 0..<nl[0] {
    var isRoad = true
    var road: [Int] = map[i]
    var bridge: [Bool] = map[i].map { _ in false }
    for j in 0..<(nl[0] - 1) {
        let gap = map[i][j] - map[i][j + 1]
        if gap > 1 {
            isRoad = false
            break
        } else if gap > 0 { // 내리막? 앞에 몇개냐
            var still = road[j + 1]
            for k in 1...nl[1] {
                let index = j + k
                if index >= nl[0] || road[index] != still || bridge[index] {
                    isRoad = false
                    break
                }
                bridge[index] = true
            }
        } else if gap < 0 { // 오르막 뒤에 몇개냐
            var still = road[j]
            for k in 0..<nl[1] {
                let index = j - k
                if index < 0 || road[index] != still || bridge[index] {
                    isRoad = false
                    break
                }
                bridge[index] = true
            }
        }
    }
    if isRoad { answer += 1 }
}

for i in 0..<nl[0] {
    var isRoad = true
    var road: [Int] = Array(0..<nl[0]).map { map[$0][i] }
    var bridge: [Bool] = map[i].map { _ in false }
    var j = 0
    for j in 0..<(nl[0] - 1) {
        let gap = map[j][i] - map[j + 1][i]
        if gap > 1 || gap < -1 {
            isRoad = false
            break
        } else if gap > 0 { // 내리막? 앞에 몇개냐
            var still = road[j + 1]
            for k in 1...nl[1] {
                let index = j + k
                if index >= nl[0] || road[index] != still || bridge[index] {
                    isRoad = false
                    break
                }
                bridge[index] = true
            }
        } else if gap < 0 { // 오르막 뒤에 몇개냐
            var still = road[j]
            for k in 0..<nl[1] {
                let index = j - k
                if index < 0 || road[index] != still || bridge[index] {
                    isRoad = false
                    break
                }
                bridge[index] = true
            }
        }
    }
    
    if isRoad { answer += 1 }
}
print(answer)