let hw = readLine()!.split(separator: " ").map { Int(String($0))! }
let blocks = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

for h in 1...hw[0] {
    var walls: [Int] = []
    for w in 0..<hw[1] {
        if h <= blocks[w] {
            walls.append(w)
        }
    }
    if walls.count >= 2 {
        for i in 1..<walls.count {
            answer += walls[i] - walls[i - 1] - 1
        }
    }
}

print(answer)