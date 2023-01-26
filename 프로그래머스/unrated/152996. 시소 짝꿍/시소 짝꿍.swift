import Foundation

func calculator(_ arr: [Int]) -> Int64 {
    return Int64(arr.count) * Int64((arr.count - 1)) / Int64(2)
}

func solution(_ weights:[Int]) -> Int64 {
    let distance = [(2, 3), (2, 4), (3, 4)]
    let weightsGrouping = Dictionary(grouping: weights) { $0 }

    var answer: Int64 = weightsGrouping.values.reduce(0) { $0 + calculator($1) }

    for w in Set(weights) {
        for (d1, d2) in distance {
            if (w * d1) % d2 != 0 { continue }
            let temp = (w * d1) / d2
            if let value = weightsGrouping[temp] {
                answer += Int64(value.count) * Int64(weightsGrouping[w]!.count)
            }
        }
    }
    
    return answer
}