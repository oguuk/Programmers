let kinds = readLine()!.split(separator: " ").map { Int(String($0))! }
var target = kinds[1]
var coins: [Int] = []

for _ in 0..<kinds[0] {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

let answer = coins.sorted(by: >).reduce(0) {
    if target > 0 {
        let value = target / $1
        target %= $1
        return $0 + value
    } else {
        return $0
    }
}

print(answer)