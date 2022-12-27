import Foundation

func solution(_ my_string:String) -> Int {
    var answer = 0
    var str = my_string.split(separator: " ").map { String($0) }
    if let _ = Int(str[0]) { str = ["+"] + str }
    for i in stride(from: 0, to: str.count - 1, by: 2) {
        if str[i] == "+" { answer += Int(str[i+1])! }
        else { answer -= Int(str[i+1])! }
    }
    return answer
}