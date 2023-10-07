let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 0
var right = n - 1
var answer = (arr[left], arr[right])
var minGap = abs(arr[left] + arr[right])

while left < right {
    let sum = arr[left] + arr[right]
    let absSum = abs(sum)
    
    if absSum < minGap {
        answer = (arr[left], arr[right])
        minGap = absSum
    }
    
    if sum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print("\(answer.0) \(answer.1)")
