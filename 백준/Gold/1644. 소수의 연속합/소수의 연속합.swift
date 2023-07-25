import Foundation
let n: Int = Int(readLine()!)!
var head = 0, tail = 0
var sum = 0
var answer = 0
var isDecimal: [Bool] = Array(repeating: true, count: n + 1)
for i in 0...Int(sqrt(Double(n))) {
    if i == 0 || i == 1 {
        isDecimal[i] = false
        continue
    }
    if !isDecimal[i] { continue }
    for j in i...n {
        let multiply = i * j
        if multiply > n { break }
        else { isDecimal[multiply] = false }
    }
}

while true {
    if sum < n {
        if head == n { break }
        if isDecimal[head] { head += 1 }
        while !isDecimal[head] {
            if head == n { break }
            head += 1
        }
        if isDecimal[head] { sum += head }
    } else {
        if sum == n { answer += 1 }
        if head == n, tail >= head { break }
        if isDecimal[tail] { tail += 1 }
        while !isDecimal[tail] {
            if tail == n { break }
            tail += 1
        }
        if isDecimal[tail] { sum -= tail }
    }
}
print(answer)