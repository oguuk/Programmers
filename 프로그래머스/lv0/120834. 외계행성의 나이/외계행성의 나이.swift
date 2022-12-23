import Foundation

func solution(_ age:Int) -> String {
    return String(age)
    .map { UnicodeScalar(Int(String($0))! + 97)! }
    .map { String($0) }.joined()
}