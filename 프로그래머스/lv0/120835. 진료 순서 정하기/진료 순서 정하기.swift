import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    var dic: [Int : Int] = [:]
    _ = emergency.sorted(by: >).enumerated().map { dic[$1] = $0  + 1 }
    return emergency.map { dic[$0]! }
}