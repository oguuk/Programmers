func solution(_ n:Int) -> Int {
    var answer = 0
    var arr = Array.init(repeating:true,count: n+1)
    
    for i in 2...n {
        if arr[i] {
            answer += 1
            for j in stride(from: i, through:n, by: i){
                arr[j] = false
            }
        }
    }
    
    return answer
}
