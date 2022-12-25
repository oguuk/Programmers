import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    return keyinput.reduce([0, 0]) {
        switch $1 {
            case "left": 
            if abs($0[0] - 1) <= (board[0] - 1)/2 { 
                return [$0[0] - 1, $0[1]]
            }
            case "right":
            if abs($0[0] + 1) <= (board[0] - 1)/2 { 
                return [$0[0] + 1, $0[1]]
            }
            case "up":
            if abs($0[1] + 1) <= (board[1] - 1)/2 { 
                return [$0[0], $0[1] + 1]
            }
            default:
            if abs($0[1] - 1) <= (board[1] - 1)/2 { 
                return [$0[0], $0[1] - 1]
            }
        }
        return $0
    }
}