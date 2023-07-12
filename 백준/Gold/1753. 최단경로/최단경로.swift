struct Heap<T: Comparable> { // > 최대힙, < 최소힙
    
    private var items: [T] = []
    var sortMethod: (T, T) -> Bool
    var isEmpty: Bool { items.count == 1 }
    var peek: T? { items.count > 0 ? items[0] : nil }
    var size: Int { items.count - 1 }
    
    init(_ nextPartialResult: @escaping (T, T) -> Bool, _ items: [T] = []) {
        if !items.isEmpty { self.items = [items.first!] + items }
        self.sortMethod = nextPartialResult
        heapify()
    }
    
    private func parentIndex(_ index: Int) -> Int { index / 2 }
    private func leftChildIndex(_ index: Int) -> Int { index * 2 }
    private func rightChildIndex(_ index: Int) -> Int { index * 2 + 1 }
    
    mutating func insert(data item: T) {
        items.append(item)
        if isEmpty { items.append(item) }
        siftUp(from: items.count - 1)
    }
    
    mutating func remove() -> T? {
        if isEmpty { return nil }
        items.swapAt(1, items.count - 1)
        let value = items.popLast()!
        if !isEmpty { siftDown(from: 1) }
        return value
    }
    
    mutating func heapify() {
        for i in stride(from: items.count / 2, through: 1, by: -1) {
            siftDown(from: i)
        }
    }
    
    private mutating func siftUp(from index: Int) {
        let parentIndex = parentIndex(index)
        let parent = items[parentIndex]
        if parentIndex != 0 && sortMethod(items[index], parent) {
            items.swapAt(parentIndex, index)
            return siftUp(from: parentIndex)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var swapIndex = index
        let leftChildIndex = leftChildIndex(index)
        let rightChildIndex = rightChildIndex(index)
        
        if rightChildIndex <= size && sortMethod(items[rightChildIndex], items[swapIndex]) {
            swapIndex = rightChildIndex
        }
        
        if leftChildIndex <= size && sortMethod(items[leftChildIndex], items[swapIndex]) {
            swapIndex = leftChildIndex
        }
        
        if swapIndex != index {
            items.swapAt(swapIndex, index)
            siftDown(from: swapIndex)
        }
    }
}

struct Edge: Comparable {
    
    let from: Int
    let to: Int
    let cost: Int
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let ve = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!
var graph: [[(t: Int, c: Int)]] = Array(repeating: [], count: ve[0] + 1)

for _ in 0..<ve[1] {
    let uvw: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    graph[uvw[0]].append((uvw[1], uvw[2]))
}

var costMap: [Int] = Array(repeating: Int.max, count: ve[0] + 1)
var heap = Heap<Edge>(<)

graph[k].forEach { heap.insert(data: Edge(from: k, to: $0.t, cost: $0.c)) }

while !heap.isEmpty {
    let edge = heap.remove()!
    if costMap[edge.to] <= edge.cost { continue }
    costMap[edge.to] = edge.cost
    graph[edge.to].forEach {
        heap.insert(data: Edge(from: k, to: $0.t, cost: $0.c + edge.cost))
    }
}

costMap.enumerated().forEach {
    if $0 == k { print(0) }
    else if $0 > 0 { print($1 == Int.max ? "INF" : $1)}
}
