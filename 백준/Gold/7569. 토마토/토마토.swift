class Queue<T> {
    
    var input: [T] = []
    var output: [T] = []
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    func push(of: T) {
        input.append(of)
    }
    
    func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()
    }
}

let mnh: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let directions: [[Int]] = [[0, 0, 1], [0, 0, -1], [0, 1, 0], [0, -1, 0], [1, 0, 0], [-1, 0, 0]]
var boxs: [[[Int]]] = []
var ripedTomato: [(h: Int, r: Int, c: Int)] = []
var unripedTomato = 0
var answer = 0

for row in 0..<mnh[2] {
    boxs.append([])
     for col in 0..<mnh[1] {
         let box = readLine()!.split(separator: " ").map { Int(String($0))! }
         box.enumerated().forEach {
             if $1 == 1 { ripedTomato.append((row, col, $0)) }
             else if $1 == 0 { unripedTomato += 1 }
         }
         boxs[row].append(box)
     }
 }

var queue = Queue<(Int, Int, Int)>()
ripedTomato.forEach { queue.push(of: $0) }
var isVisit: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false,
                                                                 count: mnh[0]),
                                                count: mnh[1]),
                               count: mnh[2])

if unripedTomato == 0 { print(0) }
else {
    while !queue.isEmpty {
        let (h, m, n) = queue.pop()!
        isVisit[h][m][n] = true
        
        for direction in directions {
            let newH = h + direction[0], newM = m + direction[1], newN = n + direction[2]
            if newH < 0 || newM < 0 || newN < 0 || newH >= mnh[2] || newM >= mnh[1] || newN >= mnh[0] || boxs[newH][newM][newN] != 0 || isVisit[newH][newM][newN] {
                continue
            }
            unripedTomato -= 1
            boxs[newH][newM][newN] = max(boxs[newH][newM][newN], boxs[h][m][n]) + 1
            if answer < boxs[newH][newM][newN] { answer = boxs[newH][newM][newN] }
            queue.push(of: (newH, newM, newN))
        }
    }
    print(unripedTomato != 0 ? -1 : answer - 1)
}