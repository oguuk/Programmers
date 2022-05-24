import Foundation

func solution(_ s:String, _ n:Int) -> String {
    var answer = ""
    
    for c in s {
        let uni = c.asciiValue!
        
        if c == " "{
            answer += " "
            continue
        }
        
        if c.isUppercase {
            if uni +  UInt8(n) > 90 {
                answer += String(UnicodeScalar(uni - 26 +  UInt8(n)))
                continue
            }
            answer += String(UnicodeScalar(uni + UInt8(n)))
        } else {
                if uni +  UInt8(n) > 122 {
                    answer += String(UnicodeScalar(uni - 26 +  UInt8(n)))
                    continue
                }
            answer += String(UnicodeScalar(uni +  UInt8(n)))
        }
        
    }
    
    return answer
}
