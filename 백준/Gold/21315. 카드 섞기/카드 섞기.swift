import Foundation

func shuffle(_ cardList: [Int], _ index: Int) -> [Int] {
    guard index > 0 else { return cardList }
    let divideIndex = cardList.count - index
    let dividedCardList = Array(cardList[divideIndex...])
    return shuffle(dividedCardList, index / 2) + cardList[0..<divideIndex]
}

let n = Int(readLine()!)!
let L = readLine()!.split(separator: " ").map { Int(String($0))! }
var result: [(Int, Int)] = []
let M = Int(log2(Double(n)))

for k1 in 1...M {
    for k2 in 1...M {
        let cardList = (1...n).map { $0 }
        if shuffle(shuffle(cardList, 1 << k1), 1 << k2) == L {
            result.append((k1, k2))
        }
    }
}

if let firstResult = result.first {
    print("\(firstResult.0) \(firstResult.1)")
} else {
    print("No matching K values found.")
}
