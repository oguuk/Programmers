let n = Int(readLine()!)!
let p2p = readLine()!.split(separator: " ").map { Int($0)! }

var lis: [Int] = []

func binarySearch(_ x: Int) -> Int {
    var lo = 0
    var hi = lis.count - 1
    while lo <= hi {
        let mid = (lo + hi) / 2
        if lis[mid] < x {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return lo
}

for p in p2p {
    let pos = binarySearch(p)
    if pos == lis.count {
        lis.append(p)
    } else {
        lis[pos] = p
    }
}

print(lis.count)
