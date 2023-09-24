let n = Int(readLine()!)!
let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var operations: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var answer: (max: Int, min: Int) = (-Int.max, Int.max)

func solution(_ result: Int, _ time: Int) {
    if time == n - 1 {
        if result > answer.max { answer.max = result }
        if result < answer.min { answer.min = result }
        return
    }
    
    for i in 0..<4 {
        let newTime = time + 1
        if i == 0 {
            if operations[i] <= 0 { continue }
            operations[i] -= 1
            solution(result + nums[newTime], newTime)
            operations[i] += 1
        } else if i == 1 {
            if operations[i] <= 0 { continue }
            operations[i] -= 1
            solution(result - nums[newTime], newTime)
            operations[i] += 1
        } else if i == 2 {
            if operations[i] <= 0 { continue }
            operations[i] -= 1
            solution(result * nums[newTime], newTime)
            operations[i] += 1
        } else {
            if operations[i] <= 0 { continue }
            operations[i] -= 1
            solution(Int(result / nums[newTime]), newTime)
            operations[i] += 1
        }
    }
}

solution(nums[0], 0)
print(answer.max)
print(answer.min)