struct Heap<T: Comparable> {
    
    private var elements: [T] = []
    var sortMethod: (T, T) -> Bool
    var isEmpty: Bool { elements.count <= 1 }
    var peek: T? { isEmpty ? nil:elements[1] }
    var size: Int { elements.count - 1 }
    
    init(_ nextPartialResult: @escaping (T, T) -> Bool, _ elements: [T] = []) {
        if !elements.isEmpty { self.elements = [elements.first!] + elements }
        sortMethod = nextPartialResult
        heapify()
    }
    
    func parentIndex(_ index: Int) -> Int { index / 2 }
    func leftChildIndex(_ index: Int) -> Int { index * 2 }
    func rightChildIndex(_ index: Int) -> Int { index * 2 + 1 }
    
    mutating func insert(of item: T) {
        elements.append(item)
        if isEmpty { elements.append(item) }
        siftUp(size)
    }
    
    mutating func remove() -> T? {
        if isEmpty { return nil }
        elements.swapAt(1, size)
        let value = elements.removeLast()
        if !isEmpty { siftDown(1) }
        return value
    }
    
    mutating func heapify() {
        for index in stride(from: size, through: 1, by: -1) {
            siftDown(index)
        }
    }
    
    private mutating func siftUp(_ index: Int) {
        let indexOfParent = parentIndex(index)
        if indexOfParent != 0 && sortMethod(elements[index], elements[indexOfParent]) {
            elements.swapAt(index, indexOfParent)
            return siftUp(indexOfParent)
        }
    }
    
    private mutating func siftDown(_ index: Int) {
        var priorityIndex = index
        let indexOfRightChild = rightChildIndex(index)
        let indexOfLeftChild = leftChildIndex(index)
        
        if indexOfRightChild <= size && sortMethod(elements[indexOfRightChild], elements[priorityIndex]) {
            priorityIndex = indexOfRightChild
        }
        
        if indexOfLeftChild <= size && sortMethod(elements[indexOfLeftChild], elements[priorityIndex]) {
            priorityIndex = indexOfLeftChild
        }
        
        if priorityIndex != index {
            elements.swapAt(index, priorityIndex)
            siftDown(priorityIndex)
        }
    }
}

struct Node: Comparable {
    
    var start: Int
    var to: Int
    var cost: Int
    
    static func < (_ lhs: Node, _ rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let ve = readLine()!.split(separator: " ").map { Int($0)! }
var graph: [[(t: Int, c: Int)]] = Array(repeating: [], count: ve[0] + 1)
var heap = Heap<Node>(<)
var answer: Int = 0
var parents: [Int] = Array(0...ve[0])
var visitCount: Int = ve[0]

func find(i: Int) -> Int {
    var parent = parents[i]
    if i != parent { parent = find(i: parent) }
    return parent
}

func union(a: Int, b: Int) {
    let aParent = find(i: a)
    let bParent = find(i: b)
    if aParent > bParent {
        parents[aParent] = bParent
    } else {
        parents[bParent] = aParent
    }
}

for _ in 0..<ve[1] {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    heap.insert(of: Node(start: abc[0], to: abc[1], cost: abc[2]))
}

while !heap.isEmpty {
    if visitCount == 0 { break }
    let node = heap.remove()!
    if find(i: node.start) == find(i: node.to) { continue }
    union(a: node.start, b: node.to)
    answer += node.cost
}

print(answer)