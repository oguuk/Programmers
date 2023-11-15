let n: Int = Int(readLine()!)!
var dict: [String : Int] = [:]

for _ in 0..<n {
    let file: [String] = readLine()!.split(separator: ".").map(String.init)
    if dict[file[1]] == nil { dict[file[1]] = 0 }
    dict[file[1]]! += 1
}

dict.keys.sorted().forEach { print($0, dict[$0] ?? 0) }