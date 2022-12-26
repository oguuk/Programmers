import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var answer = 0
    var str = A
    while str != B {
        answer += 1
        str = String(str.popLast()!) + str
        if str == A { return -1 }
    }
    return answer
}