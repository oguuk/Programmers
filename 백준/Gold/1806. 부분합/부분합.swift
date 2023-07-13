let ns = readLine()!.split(separator: " ").map { Int($0)! }
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var head: Int = 0
var tail: Int = 0
var sum: Int = 0
var answer: Int = Int.max

while true {
    while sum >= ns[1] {
        if tail == head { break }
        let length = head - tail
        answer = answer > length ? length : answer
        sum -= arr[tail]
        tail += 1
    }

    if head < ns[0] {
        sum += arr[head]
        head += 1
    } else {
        if sum < ns[1] { break }
        if tail == head { break }
    }
}

print(answer == Int.max ? 0 : answer)
