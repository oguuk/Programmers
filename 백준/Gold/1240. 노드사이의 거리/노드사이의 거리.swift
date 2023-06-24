final class Node {
    
    var id: Int
    private var nodes: [(child: Node, cost: Int)] = []
    var getChilds: [(child: Node, cost: Int)] {
        return nodes
    }
    
    init(id: Int) {
        self.id = id
    }
    
    func addChild(node: Node, cost: Int) {
        let child = (node, cost)
        nodes.append(child)
    }
}

struct Tree {
    
    var nodes: [Int : Node] = [:]
    
    mutating func push(first n1: Node, second n2: Node, cost: Int) {
        if nodes[n1.id] == nil { nodes[n1.id] = n1 }
        if nodes[n2.id] == nil { nodes[n2.id] = n2 }
        nodes[n1.id]?.addChild(node: n2, cost: cost)
        nodes[n2.id]?.addChild(node: n1, cost: cost)
    }
    
    func findCost(first n1: Int, second n2: Int) -> Int {
        let root = search(id: n1)!
        var cost = Int.max
        func dfs(node: Node, totalCost: Int, isVisit: [Int:Bool]) {

            if let _ = isVisit[node.id] { return }
            
            var newVisit = isVisit
            newVisit[node.id] = true

            if node.id == n2, cost > totalCost { cost = totalCost }
            
            for n in node.getChilds {
                dfs(node: n.child, totalCost: totalCost + n.cost, isVisit: newVisit)
            }
        }
        dfs(node: root, totalCost: 0, isVisit: [Int:Bool]())
        return cost
    }
    
    private func search(id: Int) -> Node? {
        if let node = nodes[id] { return node }
        for node in nodes {
            var stack: [Node] = [node.value]
            while !stack.isEmpty {
                let node = stack.removeLast()
                if node.id == id { return node }
                stack.append(contentsOf: node.getChilds.map { $0.child })
            }
        }
        return nil
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var tree = Tree()
var reuse: [Int : Node] = [:]

for _ in 0..<nm[0] - 1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var first = Node(id: input[0])
    var second = Node(id: input[1])
    if let node = reuse[input[0]] {
        first = node
    } else {
        reuse[input[0]] = first
    }
    if let node = reuse[input[1]] {
        second = node
    } else {
        reuse[input[1]] = second
    }

    let cost = input[2]
    tree.push(first: first, second: second, cost: cost)
}

var answer: [Int] = []

for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let firstID = input[0], secondID = input[1]
    let cost = tree.findCost(first: firstID, second: secondID)
    answer.append(cost)
}

answer.forEach { print($0) }