import Foundation

func solution(_ s:String) -> Int {
    var idx = 0
    var ans = ""
    var string = ""
    
    while idx < s.count{
        string += String(s[s.index(s.startIndex,offsetBy:idx)])
        
        switch string{
            case "zero":
                ans += "0"
                string = ""
            case "one":
                ans += "1"
                string = ""
            case "two":
                ans += "2"
                string = ""
            case "three":
                ans += "3"
                string = ""
            case "four":
                ans += "4"
                string = ""
            case "five":
                ans += "5"
                string = ""
            case "six":
                ans += "6"
                string = ""
            case "seven":
                ans += "7"
                string = ""
            case "eight":
                ans += "8"
                string = ""
            case "nine":
                ans += "9"
                string = ""
            default:
                if s[s.index(s.startIndex,offsetBy:idx)].isNumber{
                    ans += String(s[s.index(s.startIndex,offsetBy:idx)])
                    string = ""
                }
        }
        idx += 1
    }
    return Int(ans)!
}
