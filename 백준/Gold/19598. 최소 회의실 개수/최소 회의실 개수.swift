let N = Int(readLine()!)!
var meetings: [(s: Int, e: Int)] = []
var lastTimes: [Int] = []
var answer = 1

for _ in 0..<N {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((info[0], info[1]))
}

meetings.sort { ($0.s, $0.e) < ($1.s, $1.e) }
lastTimes.append(meetings.first!.s)

for m in meetings {
    var include: Bool = false
    
    for l in 0..<lastTimes.count {
        if lastTimes[l] <= m.s {
            lastTimes[l] = m.e
            include.toggle()
            break
        }
    }
    
    if !include { lastTimes.append(m.e) }
}

print(lastTimes.count)