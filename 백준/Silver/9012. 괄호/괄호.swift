for _ in 0..<Int(readLine()!)! {
    var bracket = 0
    for str in readLine()! {
        if str == "(" {
            bracket += 1
        } else {
            if bracket < 1 {
                bracket = -1
                break
            }
            bracket -= 1
        }
    }
    bracket == 0 ? print("YES") : print("NO")
}