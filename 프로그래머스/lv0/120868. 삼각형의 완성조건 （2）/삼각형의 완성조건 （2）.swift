import Foundation

func solution(_ sides:[Int]) -> Int {
    return (1..<sides.reduce(0, +))
    .filter { 
        $0 < sides.reduce(0, +) && sides.sorted()[1] < sides.sorted()[0] + $0 
    }
    .count
}