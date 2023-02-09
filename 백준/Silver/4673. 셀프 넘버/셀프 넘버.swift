var table = Array(repeating: false, count: 10001)

func selfNumber(_ str: String) {
    var num = Int(str)!
    num += str.reduce(0) { $0 + Int(String($1))! }
    if num >= 10000 || table[num] { return }
    table[num] = true
    return selfNumber("\(num)")
}

for i in 1..<10000 {
    let str = "\(i)"
    selfNumber(str)
}

for (i, v) in table.enumerated() {
    if i != 0 && i != 10000 && !v { print(i) }
}