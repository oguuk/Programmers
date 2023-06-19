final class Queue<T> {
    
    var input: [T] = []
    var output: [T] = []
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    func push(_ data: T) {
        input.append(data)
    }
    
    func pop() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
    
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var queue = Queue<(position: Int, cost: Int)>()
var isVisit: [Int : Bool] = [:]

if nk[0] == nk[1] {
    print(0)
} else {
    
    queue.push((nk[0], 0))

    while !queue.isEmpty {
        let node = queue.pop()!
        
        if node.position == nk[1] {
            print(node.cost)
            break
        }
        
        if node.position * 2 < 100001 && isVisit[node.position * 2] == nil {
            isVisit[node.0 * 2] = true
            queue.push((node.0 * 2, node.cost))
        }
        
        if node.position - 1 >= 0 && isVisit[node.position - 1] == nil {
            isVisit[node.position - 1] = true
            queue.push((node.position - 1, node.cost + 1))
        }
        
        if node.position + 1 < 100001 && isVisit[node.position + 1] == nil {
            isVisit[node.position + 1] = true
            queue.push((node.position + 1, node.cost + 1))
        }
    }
}