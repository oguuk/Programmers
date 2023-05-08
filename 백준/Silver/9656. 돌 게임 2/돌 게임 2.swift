var N = Int(readLine()!)!
var turn: Bool = true
while true {
    if N == 1 || N == 3 { break }
    else if N == 2 { turn.toggle(); break }
    N -= 3
    turn.toggle()
}

print(turn ? "CY" : "SK")
