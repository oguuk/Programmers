import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
let B = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)

print(zip(A, B).reduce(0) { $0 + $1.0*$1.1})