import Foundation

func isPerfectSquare(_ n: Int) -> Bool {
    let root = Int(sqrt(Double(n)))
    return root * root == n
}

func minSquareSum() -> Int {
    let n = Int(readLine()!)!
    if isPerfectSquare(n) {
        return 1
    }

    for i in 1...Int(sqrt(Double(n))) {
        if isPerfectSquare(n - i * i) {
            return 2
        }
    }

    var reducedN = n
    while reducedN % 4 == 0 {
        reducedN /= 4
    }
    if reducedN % 8 == 7 {
        return 4
    }

    return 3
}

print(minSquareSum())