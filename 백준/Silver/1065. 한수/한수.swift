let a = Int(readLine()!)!
func wtf(_ num: Int) -> Int {
    var answer = 0
    for x in 1...num {
     if x > 99 {
         if x%10 - Int(exactly: (x%100)/10)! == Int(exactly: (x%100)/10)! - Int(exactly: x/100)!{
            answer += 1
        }
    } else {
        answer += 1
    }
    }
    print(answer)
    return answer
}

wtf(a)
