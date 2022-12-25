import Foundation

func solution(_ before:String, _ after:String) -> Int {
    return zip(before.sorted(), after.sorted()).allSatisfy { $0 == $1 } ? 1:0 
}