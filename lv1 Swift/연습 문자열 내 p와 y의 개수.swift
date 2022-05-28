import Foundation

func solution(_ s:String) -> Bool {
    var pCount = 0
    var yCount = 0
    
    for c in s {
        if c.lowercased() == "p" {
            pCount += 1
        } else if c.lowercased() == "y" {
            yCount += 1
        }
    }
 
    return pCount == yCount
}
