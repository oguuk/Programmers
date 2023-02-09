var answer = 0
var isWhite = true

for _ in 0..<8 {
    var tempWhite = isWhite
    readLine()!.forEach {
        if tempWhite && $0 == "F" { answer += 1 }
        tempWhite.toggle()
    }
    isWhite.toggle()
}

print(answer)
