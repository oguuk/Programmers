var arr = Set<String>()

for _ in 0..<Int(readLine()!)! {
    arr.insert(readLine()!)
}

Array(arr).sorted { ($0.count, $0) < ($1.count, $1) }.forEach { print($0) }