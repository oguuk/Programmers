let n: Int = Int(readLine()!)!
var town: [(n: Int, p: Double)] = []
var people: Int = 0

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    people += input[1]
    town.append((input[0], Double(input[1])))
}
town.sort { $0.n < $1.n }

var mid: Double = Double(people) / 2
var sum: Double = 0.0

for t in town {
    sum += t.p
    if sum >= mid {
        print(t.n)
        break
    }
    
}