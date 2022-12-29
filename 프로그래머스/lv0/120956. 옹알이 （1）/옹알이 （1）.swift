import Foundation

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    return babbling.filter {
        var str = $0
        words.forEach {
            str = str.replacingOccurrences(of: $0, with: "@")
        }
        return str.allSatisfy { $0 == "@" }
    }
    .count
}
