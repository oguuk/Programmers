var nc = readLine()!.split(separator: " ").map { Int($0)! }
var house: [Int] = []
var answer = 1

for _ in 0..<nc[0] {
    let num = Int(readLine()!)!
    house.append(num)
}

house = house.sorted(by: <)

var front = 1
var back = house.last! - house.first!

func moveOn(_ distance: Int) -> Bool {
    var lastIndex = 0, count = nc[1] - 1
    while count > 0 {
        let nextValue = house[lastIndex] + distance
        var index = lastIndex
        while house[index] < nextValue {
            index += 1
            if index == house.count { return false }
        }
        count -= 1
        lastIndex = index
    }
    return true
}

while front <= back {
    let mid = (front + back) / 2
    if moveOn(mid) {
        front = mid + 1
        answer = max(answer, mid)
    } else {
        back = mid - 1
    }
}

print(answer)