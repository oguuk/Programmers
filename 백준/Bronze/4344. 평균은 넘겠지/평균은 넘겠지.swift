import Foundation

var n = Int(readLine()!)!
while n > 0 {
    let score = readLine()!.split(separator: " ").map{Int($0)!}
    let avg = score[1...score[0]].reduce(0){$0+$1}/score[0]
    var student = 0.0
    for x in 1..<score.count {
        if score[x] > avg {
            student += 1
        }
    }
    print("\(String(format: "%.3f", round(student/Double(score[0]) * 100.0 * pow(10, 3)) / 1000.0))%")
    n -= 1
}