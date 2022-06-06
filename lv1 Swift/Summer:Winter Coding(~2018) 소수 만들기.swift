import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let num = nums[i]+nums[j]+nums[k]
                for n in 2..<num {
                    if num % n == 0{
                        break
                    }
                    if n == num - 1 {
                        answer += 1
                    }
                }
            }
        }
    }

    return answer
}
