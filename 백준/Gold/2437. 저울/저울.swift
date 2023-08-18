let n = Int(readLine()!)!
var choo: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var target: Int = 1

for c in choo {
    if target < c { break }
    target += c
}

print(target)
