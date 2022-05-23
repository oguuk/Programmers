func solution(_ num:Int) -> Int {
    var time = 0
    var n = num
    
    while time < 501{
        if n == 1 {
            return time
        }
        
        if n % 2 == 0{
            n = n/2
        } else {
            n = n * 3 + 1
        }
        
        time += 1
    }
    return -1
}
