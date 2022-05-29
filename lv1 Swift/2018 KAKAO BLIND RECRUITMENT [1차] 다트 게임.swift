func solution(_ dartResult:String) -> Int {
    var arr = [Int]()
    var index = 0
    var num = ""
    
    for c in dartResult {
        if c.isLetter {
            arr.append(Int(num)!)
            
            num = ""
            
            if c == "T" {
                arr[index] = arr.last!*arr.last!*arr.last!
            } else if c == "D" {
                arr[index] = arr.last!*arr.last!
            }
            
            index += 1
        } else {
            if c == "*" {
                let start = index-2 > -1 ? index-2:0
                for i in start...index-1 {
                    arr[i] *= 2
                }
            } else if c == "#" {
                arr[index-1] *= -1
            } else {
                num += String(c)
            }
            
        }
    }
    return arr.reduce(0,+)
}
