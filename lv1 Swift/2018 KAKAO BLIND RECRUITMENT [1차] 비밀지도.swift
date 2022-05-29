import CoreFoundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for (first,second) in zip(arr1,arr2) {
        let binary = String(Int(String(first, radix: 2))! +
                            Int(String(second, radix: 2))!
                           )
        var str = ""
        
        for b in binary {
            if b == "1" || b == "2" { str += "#" }
            else { str += " " }
        }
        if str.count < n {
            for _ in 0...n-str.count-1{
                str = " \(str)"
            }
        }
        answer.append(str)
    }
    return answer
}
