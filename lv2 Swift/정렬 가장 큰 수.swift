import Foundation

func solution(_ numbers:[Int]) -> String {
    if numbers.reduce(0,+) == 0 {return "0"}
    return numbers.map{String($0)}.sorted{String(repeating: $0, count: 4) > String(repeating: $1, count: 4)}.reduce("",+)
}
