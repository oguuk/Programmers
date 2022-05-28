import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visit = Array(repeating:false, count: n)
    var ans = 0
    
    for index in 0..<n {
        if visit[index] {continue}
        dfs(&visit,index,computers)
        ans += 1
    }
    
    return ans
}

func dfs(_ visit: inout [Bool],_ index:Int,_ computers:[[Int]]) -> Void{
    if visit[index] { return }
    visit[index] = true
    
    for i in 0..<computers[index].count{
        if i == index {continue}
        if computers[index][i] == 1{
            dfs(&visit,i,computers)
        }
    }
}
