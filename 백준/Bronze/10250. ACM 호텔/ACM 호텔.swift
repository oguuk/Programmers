import Foundation

let T: Int = Int(readLine()!)!
var answer: [String] = []
for _ in 0..<T {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let h = input[0], _ = input[1], n = input[2]

    let room = "\(n % h == 0 ? h : n % h)\(String(format: "%02d", Int(ceil(Double(n) / Double(h)))))"
    answer.append(room)
}
answer.forEach { print($0) }
