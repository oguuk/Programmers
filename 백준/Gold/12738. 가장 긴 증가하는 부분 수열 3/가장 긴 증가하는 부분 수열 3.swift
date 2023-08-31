let n = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").map { Int($0)! }
var answer: [Int] = [inputs[0]]

for i in 1..<inputs.count {
    if answer.last! < inputs[i] {
        answer.append(inputs[i])
    } else {
        var index = 0
        var front = 0
        var back = answer.count - 1
        while true {
            if front > back { index = front; break }
            let mid = (front + back) / 2
            if answer[mid] > inputs[i] { back = mid - 1 }
            else if answer[mid] == inputs[i] { index = mid; break }
            else { front = mid + 1 }
        }
        answer[index] = inputs[i]
    }
}

print(answer.count)