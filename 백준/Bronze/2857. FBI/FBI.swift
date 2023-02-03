import Foundation

var answer: [Int] = []

for i in 1...5 {
    let str = readLine()!
    if str.contains("FBI") { answer.append(i) }
}

if answer.count == 0 { print("HE GOT AWAY!") }
else { answer.forEach { print($0) } }