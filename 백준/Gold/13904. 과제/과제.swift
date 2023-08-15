final class Heap<T: Comparable> {
    
    private let sort: (T, T) -> Bool
    var elements: [T]
    var size: Int { elements.count < 2 ? 0 : elements.count - 1 }
    var isEmpty: Bool { elements.count < 2 }
    var peek: T? { isEmpty ? nil : elements[1] }
    var count: Int { isEmpty ? 0 : elements.count - 1 }
    
    init(_ sort: @escaping (T, T) -> Bool , _ elements: [T] = [] ) {
        self.sort = sort
        if !elements.isEmpty { self.elements = [elements.first!] + elements }
        else { self.elements = elements }
        heapify()
    }
    
    func indexOfParent(_ index: Int) -> Int { index / 2 }
    func indexOfRightChild(_ index: Int) -> Int { index * 2 + 1 }
    func indexOfLeftChild(_ index: Int) -> Int { index * 2 }
    
    func insert(_ data: T) {
        if elements.isEmpty { self.elements.append(data) }
        elements.append(data)
        siftUp(size)
    }
    
    func remove() -> T? {
        if isEmpty { return nil }
        elements.swapAt(1, size)
        let returnValue = elements.removeLast()
        if !isEmpty { siftDown(1) }
        return returnValue
    }
    
    func heapify() {
        for i in stride(from: elements.count / 2, through: 1, by: -1) {
            siftDown(i)
        }
    }
    
    private func siftDown(_ index: Int) {
        var priorityIndex = index
        let rightChildIndex = indexOfRightChild(index)
        let leftChildIndex = indexOfLeftChild(index)
        
        if size >= rightChildIndex && sort(elements[rightChildIndex], elements[priorityIndex]) {
            priorityIndex = rightChildIndex
        }
        
        if size >= leftChildIndex && sort(elements[leftChildIndex], elements[priorityIndex]) {
            priorityIndex = leftChildIndex
        }
        
        if priorityIndex != index {
            elements.swapAt(priorityIndex, index)
            return siftDown(priorityIndex)
        }
    }
    
    private func siftUp(_ index: Int) {
        let parentIndex = indexOfParent(index)
        if parentIndex < 1 || index > size { return }
        if sort(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            return siftUp(parentIndex)
        }
    }
}

struct Node: Comparable {
    
    var d: Int
    var w: Int
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.d < rhs.d
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.d == rhs.d
    }
}

struct wNode: Comparable {
    
    var d: Int
    var w: Int
    
    static func < (lhs: wNode, rhs: wNode) -> Bool {
        return lhs.w < rhs.w
    }
    
    static func == (lhs: wNode, rhs: wNode) -> Bool {
        return lhs.w == rhs.w
    }
}

let n = Int(readLine()!)!
var homework = Heap<Node>(>)
var lastDay = 0

for _ in 0..<n {
    let dw = readLine()!.split(separator: " ").map { Int($0)! }
    homework.insert(Node(d: dw[0], w: dw[1]))
    lastDay = max(lastDay, dw[0])
}

var canSolve = Heap<wNode>(>)
var answer: Int = 0

for i in stride(from: lastDay, through: 1, by: -1) {
    while homework.peek != nil && homework.peek!.d >= i {
        let node = homework.remove()!
        canSolve.insert(wNode(d: node.d, w: node.w))
    }
    if let solve = canSolve.remove() {
        answer += solve.w
    }
}

print(answer)