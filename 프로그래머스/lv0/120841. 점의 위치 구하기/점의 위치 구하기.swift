import Foundation

func solution(_ dot:[Int]) -> Int {
    switch dot[0] {
        case 1...500:
        if dot[1] > 0 { return 1 }
        else { return 4 }
        default:
        if dot[1] > 0 { return 2 }
    }
    
    return 3
}