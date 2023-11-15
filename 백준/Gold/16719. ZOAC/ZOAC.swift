var str: String = readLine()!
let strCount = str.count
var answer: [String] = []

for i in 0..<strCount {
    if i == 0 {
        answer.append(str)
    } else {
        let newStr: [String] = str.map(String.init)
        var arr: [String] = []
        for j in 0..<newStr.count {
            if j == 0 {
                arr.append(newStr[1...].joined())
            } else if j == newStr.count - 1 {
                arr.append(newStr[0..<j].joined())
            } else {
                arr.append((newStr[0..<j] + newStr[(j+1)...]).joined())
            }
        }
        str = arr.sorted()[0]
        answer.append(str)
    }
}

answer.reversed().forEach { print($0) }