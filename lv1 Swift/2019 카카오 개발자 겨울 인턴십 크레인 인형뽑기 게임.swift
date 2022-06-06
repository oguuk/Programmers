import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var ans = 0
    var arr = board
    var stack = [Int]()
    
    for col in moves {
        var row = 0
        
        while true{
            if row == arr.count {
                break
            }
            
            if arr[row][col-1] != 0 {
                stack.append(arr[row][col-1])
                arr[row][col-1] = 0
                break
            }
            
            row += 1
        }

        if stack.count > 1 {
            if stack[stack.count-1] == stack[stack.count-2] {
                ans += 2
                stack.removeLast()
                stack.removeLast()
            }
        }
    }
    
    return ans
}
