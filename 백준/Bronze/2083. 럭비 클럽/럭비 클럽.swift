var answer: [String] = []

while true {
    let input: [String] = readLine()!.split(separator: " ").map(String.init)
    if input[0] == "#" { break }
    if Int(input[1])! > 17 || Int(input[2])! >= 80 {
        answer.append(input[0] + " Senior")
    } else {
        answer.append(input[0] + " Junior")
    }
}

answer.forEach { print($0) }