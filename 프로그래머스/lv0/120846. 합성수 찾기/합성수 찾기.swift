import Foundation

func solution(_ n:Int) -> Int {
    if n < 4 { return 0 }
    return n - 2 - (3...n).filter { num in (2..<num).allSatisfy { num % $0 != 0 } }.count
}