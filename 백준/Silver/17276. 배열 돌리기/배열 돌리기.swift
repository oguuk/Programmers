let t = Int(readLine()!)!
var answer: [[[Int]]] = []

for _ in 0..<t {
    let nd = readLine()!.split(separator: " ").map { Int($0)! }
    var arr: [[Int]] = []
    for _ in 0..<nd[0] {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(input)
    }
    let times = abs(nd[1]) / 45
    for _ in 0..<times {
        arr = rotate(arr, nd[0], nd[1] < 0)
    }
    answer.append(arr)
}

func rotate(_ arr: [[Int]], _ n: Int, _ isMinus: Bool) -> [[Int]] {
    var newArr: [[Int]] = arr
    let mid = (n + 1) / 2 - 1
    for i in 0..<n {
        if isMinus {
            newArr[i][mid] = arr[i][n - 1 - i]
            newArr[i][i] = arr[i][mid]
            newArr[mid][i] = arr[i][i]
            newArr[n - 1 - i][i] = arr[mid][i]
        } else {
            newArr[i][mid] = arr[i][i]
            newArr[n - 1 - i][i] = arr[n - 1 - i][mid]
            newArr[mid][i] = arr[n - 1 - i][i]
            newArr[i][i] = arr[mid][i]
        }
    }
    return newArr
}


answer.forEach { $0.forEach { print($0.map { String($0) }.joined(separator: " ")) } }