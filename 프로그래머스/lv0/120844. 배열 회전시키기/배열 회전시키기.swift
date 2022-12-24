import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {
    var answer = numbers
    switch direction {
        case "right": answer.insert(answer.popLast()!, at: 0)
        default: 
        answer.append(answer[0])
        answer.removeFirst() 
    }
    return answer
}