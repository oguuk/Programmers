import Foundation

func solution(_ new_id:String) -> String {
    var answer = ""
    
    for i in new_id{
        if i.isLetter{answer += i.lowercased()}
        else if i.isNumber{ answer += String(i)}
        else if i == "_" || i == "-" || i == "."{ answer += String(i)}
    }

    while answer.contains(".."){
        answer = answer.description.replacingOccurrences(of:"..",with:".")
    }
    
    if let firstChar = answer.first{
        if firstChar == "."{
            answer = String(answer.dropFirst())
        }
    }
    if let lastChar = answer.last{
        if lastChar == "."{
            answer = String(answer.dropLast())
        }
    }
    
    if answer.count > 15{
        answer = String(answer[answer.startIndex..<answer.index(answer.startIndex,offsetBy:15)])
        if answer[answer.index(before:answer.endIndex)] == "."{
            answer = String(answer.dropLast())
        }
    }else if answer.count == 0 {
        answer = "a"
    }
    
    if answer.count < 3 {
        var string = String(repeating:answer.last!,count:3)
        answer = answer + string
        answer = String(answer[answer.startIndex..<answer.index(answer.startIndex,offsetBy:3)])
    }
    
    return answer
}
