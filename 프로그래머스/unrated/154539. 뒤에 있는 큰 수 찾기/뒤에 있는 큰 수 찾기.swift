import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    let newNums = numbers.reversed() as Array
    var maxValue = newNums[0]
    var que: [Int] = []
    return newNums.map { num in
        if num >= maxValue {
            que = [num]
            maxValue = num
            return -1
        } else {
            while !que.isEmpty {
                let temp = que.popLast()!
                if temp > num {
                    que.append(temp)
                    que.append(num)
                    return temp
                }
            }
            return maxValue
        }
    }.reversed()
}