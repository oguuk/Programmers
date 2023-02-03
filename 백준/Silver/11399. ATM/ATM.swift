import Foundation

let _ = readLine()
var answer = readLine()!
.split(separator: " ")
.map { Int(String($0))! }
.sorted { $0 > $1 }
.enumerated()
.reduce(0) {
    $0 + (($1.0 + 1) * $1.1)
}
print(answer)