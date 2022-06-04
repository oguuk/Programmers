import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var ans = [Int]()
    var stay = [Int: Int]()
    var stageClear = Array(repeating: 0, count: N+2)
    
    for i in 1...N { stay[i] = 0 }

    for i in stages {
        if i == N+1 {
            stageClear[i-1] += 1
            continue
        }
        else {
            stageClear[i] += 1
        }
        
        stay[i]! += 1
    }
    
    for i in stride(from: N+1, through:2, by: -1) {
        stageClear[i-1] += stageClear[i]
    }
    
    let srt = stay.sorted{

        if Double($0.1)/Double(stageClear[$0.0]) > Double($1.1)/Double(stageClear[$1.0])
        { return true }
        else if Double($0.1)/Double(stageClear[$0.0]) < Double($1.1)/Double(stageClear[$1.0])
        { return false }

        return $0.0 < $1.0
    }
    
    for i in 0..<srt.count {
        ans.append(srt[i].key)
    }
    
    return ans
}
