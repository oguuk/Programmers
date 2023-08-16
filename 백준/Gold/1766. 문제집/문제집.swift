struct Heap<T: Comparable> {
    
    private let sort: (T, T) -> Bool
    private var items: [T]
    var isEmpty: Bool { items.count < 2 }
    var peek: T? { isEmpty ? nil : items[1] }
    var size: Int { isEmpty ? 0 : items.count - 1 }
    var count: Int { isEmpty ? 0 : items.count - 1 }
    
    init(_ sort: @escaping (T, T) ->  Bool, _ items: [T] = []) {
        self.sort = sort
        if items.count > 0 { self.items = [items.first!] + items }
        else { self.items = items }
        heapify()
    }
    
    func indexOfParent(_ index: Int) -> Int { return index / 2 }
    func indexOfRightChild(_ index: Int) -> Int { return index * 2 + 1  }
    func indexOfLeftChild(_ index: Int) -> Int { return index * 2 }
    
    mutating func insert(_ data: T) {
        if items.count == 0 { items.append(data) }
        items.append(data)
        siftUp(size)
    }
    
    mutating func remove() -> T? {
        if isEmpty { return nil }
        items.swapAt(1, size)
        let returnValue = items.removeLast()
        if !isEmpty { siftDown(1) }
        return returnValue
    }
    
    mutating func heapify() {
        for i in stride(from: size / 2, through: 1, by: -1) {
            siftDown(i)
        }
    }
    
    mutating func siftUp(_ index: Int) {
        let parentIndex = indexOfParent(index)
        if size < index || parentIndex < 1 { return }
        if sort(items[index], items[parentIndex]) {
            items.swapAt(index, parentIndex)
            siftUp(parentIndex)
        }
    }
    
    mutating func siftDown(_ index: Int) {
        var priorityIndex = index
        let rightChildIndex = indexOfRightChild(index)
        let leftChildIndex = indexOfLeftChild(index)
        
        if rightChildIndex <= size, sort(items[rightChildIndex], items[priorityIndex]) {
            priorityIndex = rightChildIndex
        }
        
        if leftChildIndex <= size, sort(items[leftChildIndex], items[priorityIndex]) {
            priorityIndex = leftChildIndex
        }
        
        if priorityIndex != index {
            items.swapAt(index, priorityIndex)
            siftDown(priorityIndex)
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var problems: [Int : [Int]] = [:]
var entry: [Int] = Array(repeating: 0, count: nm[0] + 1)
var heap = Heap<Int>(<)
var answer: [Int] = []

for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if problems[input[0]] == nil { problems[input[0]] = [] }
    problems[input[0]]?.append(input[1])
    entry[input[1]] += 1
}

for i in 1...nm[0] {
    if entry[i] == 0 { heap.insert(i) }
}

while !heap.isEmpty {
    let node = heap.remove()!
    answer.append(node)
    for next in problems[node] ?? [] {
        entry[next] -= 1
        if entry[next] == 0 { heap.insert(next) }
    }
}

print(answer.map { String($0) }.joined(separator: " "))