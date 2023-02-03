readLine()
let arr = readLine()!.split(separator: " ")
let dict = Dictionary(grouping: arr) { $0 }
readLine()
var answer: [Int] = []
readLine()!.split(separator: " ").forEach { 
    if let _ = dict[$0] {
        answer.append(1)
    } else {
        answer.append(0)
    }
}
answer.forEach { print($0) }