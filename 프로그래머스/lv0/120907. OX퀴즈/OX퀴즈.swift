import Foundation

func solution(_ quiz:[String]) -> [String] {
    let str = quiz
    .map { $0.replacingOccurrences(of: "- ", with: "-") }
    .map { $0.replacingOccurrences(of: "--", with: "+") }
    .map { $0.replacingOccurrences(of: " = ", with: "=") }
    .map { $0.split(separator: "=").map { String($0) } }

    return str.map { 
        $0[0].split(separator: " ")
        .reduce(0) { 
            if $1 == "+" { return $0 }
            else { return $0 + Int($1)! }
        } == (Int($0[1]) ?? 0) ? "O" : "X"
    }
}