import Foundation

func solution(_ babbling:[String]) -> Int {
    return babbling.filter {
        var str = $0
        ["aya", "ye", "woo", "ma"].forEach {
            str = str.replacingOccurrences(of: $0, with: "@")
        }
        return str.allSatisfy { $0 == "@" }
    }
    .count
}
