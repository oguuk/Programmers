import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer = board
    
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] == 1 {
                bfs([i, j], board, &answer)
            }
        }
    }
    return answer.map { $0.filter { $0 == 0 }.count }.reduce(0, +)
}

func bfs(_ curr: [Int], _ board: [[Int]], _ map: inout [[Int]]) {
    let direction = [[-1, -1], [-1, 0], [-1, 1],
                     [0, -1], [0, 1],
                     [1, -1], [1, 0], [1, 1]
                    ]
    for d in direction {
        if 0..<board.count ~= curr[0] + d[0] 
        && 0..<board.count ~= curr[1] + d[1] {
            if map[curr[0] + d[0]][curr[1] + d[1]] == 1 { continue }
            map[curr[0] + d[0]][curr[1] + d[1]] = 2
        }
    }
}