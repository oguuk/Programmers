import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    let limitIndex: Int = picks.map { $0 * 5 }.reduce(0, +) - 1
    var quantity: [Int] = [0, 0, 0]
    var newMinerals: [[Int]] = []
    
    for (index, value) in minerals.enumerated() {
        if index > limitIndex { break }
        switch value {
            case "diamond": quantity[0] += 1
            case "iron": quantity[1] += 1
            default: quantity[2] += 1
        }
        
        if (index + 1) % 5 == 0 || index == minerals.endIndex - 1 {
            let cost = quantity[0] * 25 + quantity[1] * 5 + quantity[2]
            newMinerals.append([cost, quantity[0], quantity[1], quantity[2]])
            quantity = [0, 0, 0]
        }
    }
    
    quantity = picks
    
    return newMinerals
    .sorted { $0[0] > $1[0] }
    .reduce(0) { pre, post in
        if quantity[0] > 0 {
            quantity[0] -= 1
            return pre + post[1...].reduce(0, +)
        } else if quantity[1] > 0 {
            quantity[1] -= 1
            return pre + post[1] * 5 + post[2...].reduce(0, +)
        } else {
            quantity[2] -= 1
            return pre + post[1] * 25 + post[2] * 5 + post[3]
        }
    }
}
