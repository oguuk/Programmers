import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    let odd = total / num
    let even = Int(floor(Double((total - (0...num-1).reduce(0, +) + 1)) / Double(num)))
    return num % 2 != 0 ? 
    (odd - (num / 2)...odd + (num / 2)).map { Int(String($0))! } : (even...(even + num - 1)).map { Int(String($0))! }
}