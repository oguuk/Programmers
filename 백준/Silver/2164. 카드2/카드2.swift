import Foundation

var cards: [Int] = (1...Int(readLine()!)!).map { $0 }.reversed()
var input: [Int] = []
var flag: Bool = true

if cards.count == 1 { print(cards[0]); exit(0) }

while true {
    if cards.count == 0 {
        if input.count < 2 { break }
        cards = input.reversed()
        input = []
    }
    if let card = cards.popLast(), !flag {
        input.append(card)
    }
    
    flag.toggle()
}

print(input[0])