import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<signs.count).reduce(0){
        if signs[$1]{
            return $0 + absolutes[$1]
        } else {
            return $0 - absolutes[$1]
        }
    }
}
