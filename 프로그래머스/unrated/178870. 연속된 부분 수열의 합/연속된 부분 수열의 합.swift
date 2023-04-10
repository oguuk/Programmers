import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var answer: [[Int]] = []
    var head: Int = 0
    var tail: Int = 0
    var next: Int = sequence[tail]
    var sum: Int = 0
    let endIndex = sequence.endIndex - 1
    
    while true {
        sum += next
        if tail == endIndex, head == tail {
            if sum == k { answer.append([head, tail]) }
            break
        }
        
        if sum >= k {
            if sum == k { answer.append([head, tail]) }
            next = -sequence[head]
            head += 1
        } else {
            if tail == endIndex {
                next = -sequence[head]
                head += 1
            } else {
                tail += 1
                next = sequence[tail]
            }
        }
    }
    
    return answer
    .sorted { ($0[1] - $0[0], $0[0]) < ($1[1] - $1[0], $1[0]) }
    .first!
}