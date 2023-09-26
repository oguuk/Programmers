let limit: Int = 6
var arrs: [[Int]] = []
var arr: [Int] = []

while true {
    let readline = readLine()!
    if readline == "0" { break }
    let c: [Int] = readline.split(separator: " ")[1...].map { Int($0)! }
    arrs.append(c)
}
var answers: [[[Int]]] = Array(repeating: [[Int]](), count: arrs.count)
func solution(_ arrNumber: Int, _ start: Int) {
    if arr.count == 6 {
        answers[arrNumber].append(arr)
        return
    }
    
    for i in start..<(arrs[arrNumber].count) {
        arr.append(arrs[arrNumber][i])
        solution(arrNumber, i + 1)
        arr.popLast()
    }
}

for i in 0..<arrs.count {
    solution(i, 0)
}

let EOI = answers.count

for i in 0..<EOI {
    answers[i].forEach { print($0.map { String($0) }.joined(separator: " ")) }
    if i != EOI - 1 { print("") }
}