import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var answer: Int64 = 0
    var startWithMinus: Int64 = 0
    var startWithPlus: Int64 = 0
    
    for (i, s) in sequence.enumerated() {
        let value: Int64 = Int64(s) * (i % 2 == 0 ? -1:1)
        startWithMinus = Int64(max(startWithMinus + value, value))
        startWithPlus = Int64(max(startWithPlus + (-1 * value), (-1 * value)))
        if answer < max(startWithMinus, startWithPlus) {
            answer = max(startWithMinus, startWithPlus)
        }
    }
    
    return answer
}