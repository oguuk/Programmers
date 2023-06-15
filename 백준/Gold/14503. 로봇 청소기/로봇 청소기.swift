let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let posi = readLine()!.split(separator: " ").map { Int(String($0))! }
let directions: [[Int]] = [[1, 0], [-1, 0], [0, 1], [0, -1]]
var position: (r: Int, c: Int, d: Int) = (posi[0], posi[1], posi[2])
var room: [[Int]] = []
var answer: Int = 0

for _ in 0..<nm[0] {
    room.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func imbeded(position: (Int, Int, Int)) {
    let r = position.0, c = position.1, d = position.2
    var isUncleanRoomExist: Bool = false
    if room[r][c] == 0 {
        room[r][c] = 2
        answer += 1
    } else if room[r][c] == 1 { return }
    
    for direction in directions {
        let newR = r + direction[0], newC = c + direction[1]
        if newR >= nm[0] || newC >= nm[1] || newR < 0 || newC < 0 { continue }
        if room[newR][newC] == 0 { isUncleanRoomExist = true }
    }
    
    if !isUncleanRoomExist {
        var newPosition = (0, 0, d)
        switch d {
        case 0:
            newPosition = (r + 1, c, d)
            if newPosition.0 < nm[0] {
                return imbeded(position: newPosition)
            }
        case 1:
            newPosition = (r, c - 1, d)
            if newPosition.1 >= 0 {
                return imbeded(position: newPosition)
            }
        case 2:
            newPosition = (r - 1, c, d)
            if newPosition.0 >= 0 {
                return imbeded(position: newPosition)
            }
        default:
            newPosition = (r, c + 1, d)
            if newPosition.1 < nm[1] {
                return imbeded(position: newPosition)
            }
        }
    } else {
        var newD = d - 1 < 0 ? 3 : d - 1
        var newPosition = (0, 0, newD)
        while true {
            switch newD {
            case 0:
                newPosition = (r - 1, c, newD)
                if newPosition.0 >= 0, room[newPosition.0][newPosition.1] == 0 {
                    return imbeded(position: newPosition)
                }
            case 1:
                newPosition = (r, c + 1, newD)
                if newPosition.1 < nm[1], room[newPosition.0][newPosition.1] == 0 {
                    return imbeded(position: newPosition)
                }
            case 2:
                newPosition = (r + 1, c, newD)
                if newPosition.0 < nm[0], room[newPosition.0][newPosition.1] == 0 {
                    return imbeded(position: newPosition)
                }
            default:
                newPosition = (r, c - 1, newD)
                if newPosition.1 >= 0, room[newPosition.0][newPosition.1] == 0 {
                    return imbeded(position: newPosition)
                }
            }
            newD = newD - 1 < 0 ? 3 : newD - 1
        }
    }
    return
}

imbeded(position: position)

print(answer)
