let n = Int(readLine()!)!
let m = Int(readLine()!)!

var parent: [Int : Int] = [:]
var nodes: [(p: Int, c: Int, v: Int)] = []
var answer = 0

(1...n).forEach { parent[$0] = $0 }

for _ in 0..<m {
    let node = readLine()!.split(separator: " ").map { Int(String($0))! }
    nodes.append((node[0], node[1], node[2]))
}

nodes = nodes.sorted { $0.v < $1.v }

func find(num: Int) -> Int {
    if parent[num] == num { return num }
    else { parent[num] = find(num: parent[num]!) }
    return parent[num]!
}

func union(a: Int, b: Int) {
    let first = find(num: a)
    let second = find(num: b)
    
    if first < second { parent[second] = first }
    else { parent[first] = second }
}

for node in nodes {
    if find(num: node.p) != find(num: node.c) {
        answer += node.v
        union(a: node.p, b: node.c)
    }
}

print(answer)