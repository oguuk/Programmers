import Foundation

func solution(_ s:String) -> String {
    var answer = ""
    
    for str in s.components(separatedBy: " ") {
        for (index, value) in str.enumerated() {
            if index % 2 == 0 {
            answer += "\(value.uppercased())"
        } else {
            answer += "\(value.lowercased())"
        }
      }
        answer += " "
    }
    
    return String(answer[answer.startIndex..<answer.index(before: answer.endIndex)])
}
