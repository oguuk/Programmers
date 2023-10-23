let nk = readLine()!.split(separator: " ").map { Int($0)! }
let kids: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var differences: [Int] = []

for i in 1..<nk[0] { differences.append(kids[i] - kids[i-1]) }

differences.sort()

let answer = differences.prefix(nk[0]-nk[1]).reduce(0, +)
print(answer)