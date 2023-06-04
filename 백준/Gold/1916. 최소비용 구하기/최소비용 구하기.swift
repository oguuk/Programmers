let n = Int(readLine()!)!
let m = Int(readLine()!)!

var cityArr: [[(end: Int, cost: Int)]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    cityArr[input[0]].append((input[1], input[2]))
}

let fromTo = readLine()!.split(separator: " ").map { Int(String($0))! }

var costArr: [Int] = Array(repeating: Int.max, count: n + 1)
var isVisit: [Bool] = Array(repeating: false, count: n + 1)
isVisit[0] = true
costArr[fromTo[0]] = 0

func solution(_ curr: Int) {
    if curr == fromTo[1] { return }
    isVisit[curr] = true
    
    for (end, cost) in cityArr[curr] {
        costArr[end] = min(costArr[end], costArr[curr] + cost)
    }
    
    let next = costArr.enumerated()
        .filter { !isVisit[$0.offset] }
        .min { $0.element < $1.element }!
        .offset
    
    solution(next)
}

solution(fromTo[0])
print(costArr[fromTo[1]])
