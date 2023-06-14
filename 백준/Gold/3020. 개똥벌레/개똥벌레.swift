let nh = readLine()!.split(separator: " ").map { Int(String($0))! }
var upRock: [Int] = Array(repeating: 0, count: nh[1] + 2)
var downRock: [Int] = Array(repeating: 0, count: nh[1] + 2)

for i in 0..<nh[0] {
    let rock = Int(readLine()!)!
    if i % 2 == 0 {
        downRock[rock] += 1
    } else {
        upRock[rock] += 1
    }
}

var upSum = upRock
var downSum = downRock

for i in stride(from: nh[1], through: 1, by: -1) {
    upSum[i] = upSum[i + 1] + upRock[i]
    downSum[i] = downSum[i + 1] + downRock[i]
}

var smallQuantityRock = Int.max
var dict: [Int : Int] = [:]

for i in 1...nh[1] {
    let sum = upSum[nh[1] - i + 1] + downSum[i]
    if dict[sum] == nil { dict[sum] = 0 }
    if sum < smallQuantityRock { smallQuantityRock = sum }
    dict[sum]! += 1
}

print(smallQuantityRock, dict[smallQuantityRock]!)
