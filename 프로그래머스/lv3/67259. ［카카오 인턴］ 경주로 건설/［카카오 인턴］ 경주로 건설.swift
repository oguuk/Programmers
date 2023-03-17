import Foundation

let head: [Int] = [0, 1, 2, 3] // 위, 왼, 아, 오 
let direction: [[Int]] = [[-1, 0], [0,1], [1,0], [0,-1]]

func solution(_ board:[[Int]]) -> Int {
    let length = board.count
    var costMap1: [[Int]] = []
    var costMap2: [[Int]] = []
    for b in board {
        var cost: [Int] = []
        for zero in b {
            if zero == 0 { cost.append(1000000) } 
            else { cost.append(-1) }
        }
        costMap1.append(cost)
        costMap2.append(cost)
    }
    dfs(&costMap1, 0, (1, 0, 0))
    dfs(&costMap2, 0, (2, 0, 0))
    return min(
        costMap1[length - 1][length - 1], 
        costMap2[length - 1][length - 1]
    )
}

func dfs(_ map: inout [[Int]], _ cost: Int, _ curr: (Int, Int, Int)) {
    let (h, r, c) = curr
    if r >= map.count || r < 0 || c >= map.count || c < 0 {
        return
    }
    if cost > map[r][c] { return }
    map[r][c] = cost
    
    for (index, value) in direction.enumerated() {
        let newR = r + value[0]
        let newC = c + value[1]
        if h % 2 == 0 {
            if index % 2 == 0 {
                dfs(&map, cost + 100, (index, newR, newC))
            } else {
                dfs(&map, cost + 600, (index, newR, newC))
            }
        } else {
            if index % 2 == 0 {
                dfs(&map, cost + 600, (index, newR, newC))
            } else {
                dfs(&map, cost + 100, (index, newR, newC))
            }
        }
    }
}