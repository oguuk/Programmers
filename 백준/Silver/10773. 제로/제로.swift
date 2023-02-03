var answer: [Int] = []
for _ in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    if num == 0 && answer.count > 0 { answer.popLast() }
    else if num != 0 { answer.append(num) }
}

print(answer.reduce(0, +))