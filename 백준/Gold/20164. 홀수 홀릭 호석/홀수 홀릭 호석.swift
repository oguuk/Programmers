var nums: [Int] = readLine()!.map { Int(String($0))! }
var maxAnswer: Int = 0
var minAnswer: Int = Int.max

func solution(_ arr: [Int], _ count: Int) {
    let len = arr.count
    
    if len >= 3 {
        for i in 1..<len-1 {
            for j in (i+1)..<len {
                let a = arr[..<i]
                let b = arr[i..<j]
                let c = arr[j..<len]
                var newCount = count
                [a, b, c].forEach { newCount += $0.filter { $0 > 0 && $0 % 2 != 0 }.count }
                var newInt = Int(a.map { String($0) }.joined())! + Int(b.map { String($0) }.joined())! + Int(c.map { String($0) }.joined())!
                var newArr = "\(newInt)".map { Int(String($0))! }
                solution(newArr, newCount)
            }
        }
    } else if len == 2 {
        for i in 1..<len {
            let a = arr[..<i]
            let b = arr[i..<len]
            var newCount = count
            [a, b].forEach { newCount += $0.filter { $0 > 0 && $0 % 2 != 0 }.count }
            
            var newInt = Int(a.map { String($0) }.joined())! + Int(b.map { String($0) }.joined())!
            var newArr = "\(newInt)".map { Int(String($0))! }
            solution(newArr, newCount)
        }
    } else {
        var newCount = count
        if let first = arr.first, first != 0 && first % 2 != 0 { newCount += 1 }
        minAnswer = min(minAnswer, newCount)
        maxAnswer = max(maxAnswer, newCount)
    }
}

solution(nums, 0)
print(minAnswer, maxAnswer)