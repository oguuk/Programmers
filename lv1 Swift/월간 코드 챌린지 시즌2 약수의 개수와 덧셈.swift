import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var ans = 0
    
    for i in left...right {
        var count = 0
        
        for j in 1...i {
            if i % j == 0 { count += 1 }
        }
        
        if count % 2 == 0 { ans += i }
        else { ans -= i}
    }
    return ans
}
