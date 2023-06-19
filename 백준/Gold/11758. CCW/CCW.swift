var x: [Int] = []
var y: [Int] = []

for _ in 0..<3 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    x.append(input[0])
    y.append(input[1])
}

let area = (x[0] * y[1] + x[1] * y[2] + x[2] * y[0]) - (y[0] * x[1] + y[1] * x[2] + y[2] * x[0])
print(area == 0 ? 0 : area > 0 ? 1 : -1)