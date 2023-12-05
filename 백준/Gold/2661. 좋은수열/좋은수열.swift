let n: Int = Int(readLine()!)!
var answer: [Int] = []
var finish = false

func isBadSequence(_ sequence: [Int]) -> Bool {
    let length = sequence.count
    if length / 2 < 1 { return false }
    for i in 1...length/2 {
        let part1 = sequence[(length - 2 * i)..<(length - i)]
        let part2 = sequence[(length - i)...]
        if part1.elementsEqual(part2) {
            return true
        }
    }
    return false
}

func solution(_ current: [Int], _ length: Int) {
    if finish { return }
    if isBadSequence(current) { return }
    if length == n {
        answer = current
        finish = true
        return
    }

    for i in 1...3 {
        solution(current + [i], length + 1)
    }
}

solution([], 0)

let answerString = answer.map(String.init).joined()
print(answerString)