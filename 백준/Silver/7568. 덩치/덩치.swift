let n = Int(readLine()!)!
var sizes: [(x: Int, y: Int)] = []
var answer: [Int] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    sizes.append((input[0], input[1]))
}

for i in 0..<n {
    var rank = 1
    for j in 0..<n {
        var xIsBigger = false, yIsBigger = false
        if i == j { continue }
        if sizes[i].x < sizes[j].x { xIsBigger = true }
        if sizes[i].y < sizes[j].y { yIsBigger = true }
        if xIsBigger && yIsBigger { rank += 1 }
    }
    answer.append(rank)
}

print(answer.map { String($0) }.joined(separator: " "))
