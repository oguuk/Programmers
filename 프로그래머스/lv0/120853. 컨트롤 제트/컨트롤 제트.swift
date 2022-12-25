import Foundation

func solution(_ s:String) -> Int {
    var splitedS = s.split(separator: " ")
    var answer = 0
    for (i, v) in splitedS.enumerated() {
        if let num = Int(v) { answer += num }
        else { answer -= Int(String(splitedS[i - 1]))! }
    } 
    return answer
}