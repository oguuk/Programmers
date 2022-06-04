import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var student = [0,0,0]
    
    let firstAnswer = [1,2,3,4,5]
    let secondAnswer = [2,1,2,3,2,4,2,5]
    let thirdAnswer = [3,3,1,1,2,2,4,4,5,5]
    
    for i in 0..<answers.count {
        if answers[i] == firstAnswer[i%5]{student[0] += 1}
        if answers[i] == secondAnswer[i%8]{student[1] += 1}
        if answers[i] == thirdAnswer[i%10]{student[2] += 1}
    }
    
    return (0..<3).filter{student[$0] >= student.max()!}.map{$0+1}
}
