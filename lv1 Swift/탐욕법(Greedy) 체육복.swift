import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var student = Array(repeating:1,count:n+1)
    
    student[0] = 0
    
    for r in reserve { student[r] += 1}
    for l in lost { student[l] -= 1 }
    
    for i in 1..<n {
        if student[i] == 0 {
           if student[i-1] == 2 {
               student[i] = 1
               student[i-1] = 1
           } else if student[i+1] == 2{
               student[i] = 1
               student[i+1] = 1
           }
        }
    }
    
    return (1...n).filter{student[$0] != 0}.count
}
