import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans = [Int]()
    
    for c in commands {
        let start = c[0]-1
        let end = c[1]-1
        let index = c[2]-1
        
        ans.append(array[start...end].sorted()[index])
    }
    return ans
}
