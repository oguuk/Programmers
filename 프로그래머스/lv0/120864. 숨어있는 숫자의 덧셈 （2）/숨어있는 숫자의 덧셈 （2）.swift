import Foundation

func solution(_ my_string:String) -> Int {
    var num = ""
    var answer = 0
    for i in my_string {
        if i.isNumber {
            num += String(i)
        } else {
            if num.count > 0 { 
                answer += Int(num)!
                num = ""
            }
        }
    }
    return num.count > 0 ? answer + Int(num)! : answer
}