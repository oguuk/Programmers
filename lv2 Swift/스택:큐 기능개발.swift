import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var day = ceil((100 - Double(progresses[0]))/Double(speeds[0]))
    var complete = 1
    var ans = [Int]()
    
    for i in 1..<speeds.count {
        var temp = ceil((100 - Double(progresses[i]))/Double(speeds[i]))
        
        if day < temp {
            ans.append(complete)
            
            day = ceil((100 - Double(progresses[i]))/Double(speeds[i]))
            complete = 1
            
        } else {complete += 1}
        
        if i == speeds.count-1 {ans.append(complete)}
    }
    
    return ans
}
