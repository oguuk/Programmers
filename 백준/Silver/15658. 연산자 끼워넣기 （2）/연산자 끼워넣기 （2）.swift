let N: Int = Int(readLine()!)!
let nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var opers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var answer: [Int] = []
var arrs: [[Int]] = []
var arr: [Int] = []

let numsCount = nums.count

func solution() {

    if arr.count == numsCount - 1 {
        arrs.append(arr)
        return
    }
    
    for i in stride(from: -1, to: -5, by: -1) {
        let index = -(i + 1)
        
        if opers[index] == 0 { continue }
        opers[index] -= 1
        arr.append(i)
        solution()
        _=arr.popLast()
        opers[index] += 1
    }
}

solution()

for ar in arrs {
    var temp: [Int] = []
    
    for i in 1..<numsCount {
        temp.append(ar[i - 1])
        temp.append(nums[i])
    }
    
    var returnValue = nums[0]
    
    for t in 0..<temp.count - 1 {
        if temp[t] == -4 {
            returnValue = Int(returnValue / temp[t + 1])
        } else if temp[t] == -3 {
            returnValue *= temp[t + 1]
        } else if temp[t] == -2 {
            returnValue -= temp[t + 1]
        } else if temp[t] == -1 {
            returnValue += temp[t + 1]
        }
    }
    
    answer.append(returnValue)
}
answer.sort()
print(answer[answer.count - 1])
print(answer[0])