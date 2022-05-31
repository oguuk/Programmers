import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var money = budget
    var count = 0
    
    for fee in d.sorted() {
        if money < fee { return count }
        money -= fee
        count += 1
    }
    
    return count
}
