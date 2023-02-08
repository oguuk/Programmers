import Foundation

var piramid: [[Int]] = []

for idx in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    piramid.append(input)
    if idx == 0 { continue }
    for (i, _) in input.enumerated() {
        
        var (rightNum, leftNum) = (0, 0)
        if i == 0 {
            leftNum = piramid[idx - 1][0]
        } else if i == input.count - 1 {
            rightNum = piramid[idx - 1].last ?? 0
        } else {
            leftNum = piramid[idx - 1][i - 1]
            rightNum = piramid[idx - 1][i]
        }
        piramid[idx][i] += leftNum >= rightNum ? leftNum : rightNum
    }
}

print(piramid.last!.max()!)
