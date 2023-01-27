import Foundation

func permutationWithRepetition<T>(arr: [T], r: Int) -> [[T]] {
    if r == 0 { return [[]] }
    if arr.isEmpty { return [] }
    var result: [[T]] = []
    for i in 0...arr.count-1 {
        for combo in permutationWithRepetition(arr: arr, r: r-1) {
            result.append([arr[i]] + combo)
        }
    }
    return result
}


func solution(
    _ users:[[Int]],
    _ emoticons:[Int]
) -> [Int] {
    var answers: [[Int]] = []
    let discounts = [10, 20, 30, 40]

    let permu = permutationWithRepetition(arr: discounts, r: emoticons.count)
    
    for p in permu {
        var cases = [0, 0]
        for u in users {
            var cost = 0.0
            for info in zip(p, emoticons) {
                if info.0 >= u[0] {
                    cost += Double(info.1) * (1.0 - Double(info.0)*0.01)
                }
            }
            if Double(u[1]) <= cost {
                cases[0] += 1
            } else {
                cases[1] += Int(cost)
            }
        }
        
        answers.append(cases)
    }
    
   return answers.max { ($0[0], $0[1]) < ($1[0], $1[1]) } ?? [0]
}