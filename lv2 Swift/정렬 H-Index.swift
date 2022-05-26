import Foundation

func solution(_ citations:[Int]) -> Int {
    var arr = citations.sorted()
    
    for (index,value) in arr.enumerated() {
        if value >= arr.count-index {return arr.count-index}
    }
    return 0
}
