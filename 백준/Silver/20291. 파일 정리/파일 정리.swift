let n: Int = Int(readLine()!)!
var dict: [String : [String]] = [:]

for _ in 0..<n {
    let file: [String] = readLine()!.split(separator: ".").map(String.init)
    if dict[file[1]] == nil { dict[file[1]] = [] }
    dict[file[1]]?.append(file[0])
}

dict.keys.sorted().forEach { print($0, dict[$0]!.count) }