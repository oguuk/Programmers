let n: Int = Int(readLine()!)!
var crain: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var m: Int = Int(readLine()!)!
var box: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var answer: Int = 0

func solution() {
    if crain.first! < box.first! {
        print(-1)
        return
    }
    while true {
        answer += 1
        var stop: Bool = true
        for i in 0..<n {
            let boxCount = box.count
            for j in 0..<boxCount {
                if box[j] <= crain[i] {
                    _=box.remove(at: j)
                    stop = false
                    m -= 1
                    break
                }
            }
        }
        if stop {
            print(answer-1)
            return
        }
    }
}

solution()