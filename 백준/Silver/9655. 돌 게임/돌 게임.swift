var N = Int(readLine()!)!
var turn: Bool = true

while true {
    if N < 3 {
        if N == 2 {
            turn.toggle()
            break
        } else {
            break
        }
    }
    N -= 3
    
    if N == 0 {
        break
    }
    turn.toggle()
}
print(turn ? "SK" : "CY")