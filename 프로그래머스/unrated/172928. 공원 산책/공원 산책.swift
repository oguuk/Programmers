import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let (rowLimit, colLimit) = (park.count - 1, park[0].count - 1)
    var start: [Int] = []
    var map: [[Bool]] = Array(repeating: Array(repeating: false,
                                               count: colLimit + 1),
                             count: rowLimit + 1)
    for (rowIndex, row) in park.enumerated() {
        for (colIndex, col) in row.enumerated() {
            if col == "S" { start = [rowIndex, colIndex] }
            switch col {
                case "X": map[rowIndex][colIndex] = false
                default: map[rowIndex][colIndex] = true
            }
        }
    }
    
    routes.forEach { route in
        let splitedStr = route.split(separator: " ")
        let to: Int = Int(splitedStr[1])!
        var flag: Bool = true  
                    
        switch splitedStr[0] {
            case "N": 
                let row = start[0] - to < 0 ? start[0] : start[0] - to
                let col = start[1]
                for index in row...start[0] { 
                    if map[index][col] == false { 
                        flag = false
                        return
                    } 
                }
                if flag { start = [row, col] }
            case "E":
                let row = start[0]
                let col = start[1] + to > colLimit ? start[1] : start[1] + to
                for index in start[1]...col { 
                    if map[row][index] == false {
                        flag = false
                        return 
                    } 
                }
                if flag { start = [row, col] }
            case "S":
                let row = start[0] + to > rowLimit ? start[0] : start[0] + to
                let col = start[1]
                for index in start[0]...row { 
                    if map[index][col] == false {
                        flag = false
                        return
                    } 
                }
                if flag { start = [row, col] }
            default:
                let row = start[0]
                let col = start[1] - to < 0 ? start[1] : start[1] - to
                for index in col...start[1] { 
                    if map[row][index] == false {
                        flag = false 
                        return
                    } 
                }
                if flag { start = [row, col] }
        }
    }
    return start
}