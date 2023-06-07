let n = Int(readLine()!)!
let m = Int(readLine()!)!

var city: [[Int]] = Array(repeating: Array(repeating: 900000000, count: n + 1), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if city[input[0]][input[1]] > input[2] {
        city[input[0]][input[1]] = input[2]
    }
}

for i in 1...n {
    for j in 1...n {
        for k in 1...n {
            if j == k { continue }
            city[j][k] = min(city[j][k], city[j][i] + city[i][k])
        }
    }
}

city.enumerated().forEach {
    if $0.offset == 0 { return }
    let answer = $0.element[1...]
    print(answer.map { $0 == 900000000 ? "0" : String($0) }.joined(separator: " "))
}
