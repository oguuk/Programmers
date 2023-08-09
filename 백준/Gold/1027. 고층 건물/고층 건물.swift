let n = Int(readLine()!)!
var buildings: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let tallest = buildings.max()!

func getSlope(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Double {
    return Double(y1 - y2) / Double(x1 - x2)
}

func getConstant(_ s: Double, _ x: Int, _ y: Int) -> Double {
    return Double(y) - s * Double(x)
}

func isHidden(_ s: Double, _ c: Double, _ x: Int, _ y: Int) -> Int {
    if Double(y) > (s * Double(x) + c) { return 1 }
    else if Double(y) == (s * Double(x) + c) { return 0 }
    return -1
}

var answer: [Int] = Array(repeating: 0, count: n)

for center in 0..<n {
    var hidePosition: (x: Int, y: Int) = (center, buildings[center])
    for left in stride(from: center, through: 0, by: -1) {
        if left == center {
            if center != 0 {
                hidePosition = (left - 1, buildings[left - 1])
            }
            continue
        }
        let position: (x: Int, y: Int) = (left, buildings[left])
        let slope = getSlope(hidePosition.x, hidePosition.y, center, buildings[center])
        let constant = getConstant(slope, hidePosition.x, hidePosition.y)
        let hide = isHidden(slope, constant, position.x, position.y)
        if hide > -1 {
            if hide == 1 || (hide == 0 && left == hidePosition.x) {
                answer[center] += 1
            }
            hidePosition = (position.x, position.y)
        }
    }

    hidePosition = (center, buildings[center])
    
    for right in center..<n {
        if right == center {
            if right != n - 1 {
                hidePosition = (right + 1, buildings[right + 1])
            }
            continue
        }
        let position: (x: Int, y: Int) = (right, buildings[right])
        let slope = getSlope(hidePosition.x, hidePosition.y, center, buildings[center])
        let constant = getConstant(slope, hidePosition.x, hidePosition.y)
        let hide = isHidden(slope, constant, position.x, position.y)

        if hide > -1 {
            if hide == 1 || (hide == 0 && right == hidePosition.x) {
                answer[center] += 1
            }
            hidePosition = (position.x, position.y)
        }
    }
}

print(answer.max()!)