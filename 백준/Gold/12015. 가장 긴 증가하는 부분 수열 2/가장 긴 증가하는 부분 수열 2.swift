let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var stack: [Int] = []

for a in arr {
    if stack.isEmpty { stack.append(a) }
    else {
        var start = 0
        var end = stack.count
        
        while start < end {
            let mid = (start + end) / 2

            if stack[mid] < a {
                start = mid + 1
            } else if stack[mid] > a {
                end = mid - 1
            } else {
                break
            }
            if start >= end {
                if end < stack.count {
                    if stack[start] < a {
                        stack[start + 1] = a
                    } else {
                        stack[start] = a
                    }
                } else {
                    stack.append(a)
                }
            }
        }
    }
}

print(stack.count)