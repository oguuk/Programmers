import Foundation

func solution(_ n:Int) -> Int {
    return "\(n)".map { Int(String($0))! }.reduce(0, +)
}