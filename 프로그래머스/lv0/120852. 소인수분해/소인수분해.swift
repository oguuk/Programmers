import CoreFoundation

func solution(_ n:Int) -> [Int] {
    var target: Int = n
    var answer: Set<Int> = []
    while target > 1 {
        for i in 2...target {
            if target % i == 0 { 
                target = target / i 
                answer.insert(i)
                break
            }
        }
    }
    return Array(answer).sorted()
}