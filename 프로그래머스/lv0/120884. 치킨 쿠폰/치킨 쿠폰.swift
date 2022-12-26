import Foundation

func solution(_ chicken:Int) -> Int {
    var answer = 0
    var remain = chicken
    
    while remain >= 10 {
        answer += remain / 10
        remain = (remain / 10) + (remain % 10)
    }
    
    return answer
}