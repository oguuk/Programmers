func solution(_ n:Int64) -> Int64 {
    var x = 1
    while x*x <= n {
        if x*x == n {
            return Int64((x+1)*(x+1))
        }
        x += 1
    }
    return -1
}
