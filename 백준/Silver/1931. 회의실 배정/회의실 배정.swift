var times:[[Int]] = []
var time = 0
var answer = 0

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    times.append(input)
}

times.sorted { ($0[1], $0[0]) < ($1[1], $1[0]) }.forEach {
    if $0[0] >= time { 
        time = $0[1]
        answer += 1
    }
}

print(answer)