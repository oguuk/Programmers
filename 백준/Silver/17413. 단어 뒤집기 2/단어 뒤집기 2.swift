var string: [String] = readLine()!.map { String($0) }
var stack: [String] = []
var noReverse: Bool = false
var answer: String = ""

for s in string {
    if s == "<" { noReverse = true }
    else if s == ">" { noReverse = false }
    
    if noReverse {
        if !stack.isEmpty {
            answer += stack.reversed().joined()
        }
        answer += s
        stack = []
    } else {
        if s == " " {
            if !stack.isEmpty {
                answer += stack.reversed().joined()
                stack = []
            }
            answer += " "
        } else if s == ">" {
            answer += s
        } else {
            stack.append(s)
        }
    }
}

if !stack.isEmpty { answer += stack.reversed().joined() }
print(answer)