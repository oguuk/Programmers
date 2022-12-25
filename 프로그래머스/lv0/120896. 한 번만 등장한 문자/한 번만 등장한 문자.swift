import Foundation

func solution(_ s: String) -> String {
    return s.filter { char in s.filter { $0 == char }.count == 1 }
    .map { String($0) }
    .sorted()
    .joined(separator: "")
}