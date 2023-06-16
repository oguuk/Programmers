var answer: [String] = []
let t = Int(readLine()!)!

for _ in 0..<t {
    let p = readLine()!
    let n = Int(readLine()!)!
    var tempStr = ""
    var isReversed = false
    var head = 0, tail = 0
    
    for char in p {
        switch char {
            case "R":
            isReversed.toggle()
            default:
            if isReversed { tail += 1 }
            else { head += 1 }
        }
    }
    
    let arr = readLine()!
    
    let xs: [Int] = arr
        .compactMap { (char: Character) -> Int? in
            if char == "[" {
                return nil
            } else if char == "]" {
                return Int(tempStr)
            } else if char == "," {
                let returnValue = tempStr
                tempStr = ""
                return Int(returnValue)
            } else {
                tempStr += String(char)
                return nil
            }
        }

    if n < head + tail {
        answer.append("error")
    } else {
        var temp: [Int] = []
        for (i, x) in xs.enumerated() {
            if i >= head && i < n - tail { temp.append(x) }
        }
        var tempStr = isReversed ? "\(temp.reversed() as [Int])" : "\(temp)"
        answer.append(tempStr.filter { $0 != " " })
    }
}

answer.forEach { print($0) }
