import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var total:Int64 = 0
    
    for i in 1...count {
        total += Int64(price)*Int64(i)
    }
    
    return total - Int64(money) > 0 ? total - Int64(money):Int64(0)
}
