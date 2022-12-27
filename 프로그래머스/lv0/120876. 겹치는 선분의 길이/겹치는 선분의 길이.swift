import Foundation

func solution(_ lines:[[Int]]) -> Int {
    let max = lines.max() { $0[1] < $1[1] }![1]
    let min = lines.min() { $0[0] < $1[0] }![0]
    var line = (0...max - min).map { _ in 0 }
    _ = lines.map { 
        (($0[0] - min)..<($0[1] - min))
        .map { line[Int(String($0))!] += 1 }
    }
    return line.filter { $0 >= 2 }.count
}