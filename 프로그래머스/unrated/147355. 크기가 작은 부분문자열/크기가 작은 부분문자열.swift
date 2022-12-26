import Foundation

func solution(_ t: String, _ p: String) -> Int {
    return (0...t.count - p.count).filter {
        let index = t.index(t.startIndex, offsetBy: $0)
        return Int(t[index...t.index(index, offsetBy: p.count - 1)])! <= Int(p)!
    }.count
}