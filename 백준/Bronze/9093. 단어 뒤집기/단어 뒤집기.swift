let n = Int(readLine()!)!
var answer: [String] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { $0.reversed() }
    answer.append(String(input.joined(separator: " ")))
}

answer.forEach { print($0) }