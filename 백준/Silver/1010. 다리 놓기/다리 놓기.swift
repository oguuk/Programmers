let T = Int(readLine()!)!
var arr: [Int] = []

func combi(_ n: Int, _ m: Int) -> Int {
    if n == 0 || n == m {
        return 1
    }
    if n > m || n < 0 || m < 0 {
        return 0
    }
    
    var result: Double = 1.0
    let smaller = min(n, m - n)
    
    for i in 0..<smaller {
        result *= Double(m - i)
        result /= Double(i + 1)
    }
    
    return Int(result)
}

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let num = combi(input[0], input[1])
    arr.append(num)
}

arr.forEach { print($0) }
