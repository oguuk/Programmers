import Foundation

func max(_ a: Int, _ b: Int) -> Int {
    return a > b ? a : b
}

var t = Int(readLine()!)!
while t > 0 {
    t -= 1
    
    let n = Int(readLine()!)!
    var a = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: 2)
    var d = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: 2)
    
    for i in 0...1 {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 1...n {
            a[i][j] = line[j - 1]
        }
    }
    
    d[0][0] = 0; d[1][0] = 0
    d[0][1] = a[0][1]; d[1][1] = a[1][1]
    
    if n >= 2 {
        for i in 2...n {
            d[0][i] = max(d[1][i - 1], d[1][i - 2]) + a[0][i]
            d[1][i] = max(d[0][i - 1], d[0][i - 2]) + a[1][i]
        }
    }
    
    print(max(d[0][n], d[1][n]))
}
