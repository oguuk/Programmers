class Time: Comparable {
    static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.end < rhs.end
    }
    
    static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.end == rhs.end
    }
    
    let start: Int
    let end: Int
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
}

struct Heap<T: Comparable> {
    
    private var policy: (T, T) -> Bool
    private var elements: [T]
    var peek: T? { elements.count < 1 ? nil : elements[1] }
    var count: Int { elements.count <= 1 ? 0 : elements.count - 1 }
    var isEmpty: Bool { elements.count <= 1 }
    func leftChildIndex(_ index: Int) -> Int { index * 2 }
    func rightChildIndex(_ index: Int) -> Int { index * 2 + 1 }
    func parentIndex(_ index: Int) -> Int { index / 2 }
    
    init(_ policy: @escaping (T, T) -> Bool, _ elements: [T] = []) {
        self.policy = policy
        self.elements = elements.count == 0 ? elements : [elements.first!] + elements
        heapify()
    }
    
    mutating func heapify() {
        for i in stride(from: count / 2, through: 1, by: -1) {
            swimDown(from: i)
        }
    }
    
    mutating func push(of data: T) {
        if elements.count == 0 { elements.append(data) }
        elements.append(data)
        swimUp(from: count)
    }
    
    mutating func pop() -> T? {
        if isEmpty { return nil }
        elements.swapAt(1, count)
        let returnValue = elements.popLast()
        if !isEmpty { swimDown(from: 1) }
        return returnValue
    }
    
    private mutating func swimUp(from index: Int) {
        let parentIndex = parentIndex(index)
        if parentIndex == 0 { return }
        if policy(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            swimUp(from: parentIndex)
        }
    }
    
    private mutating func swimDown(from index: Int) {
        var swapIndex = index
        
        let leftChildIndex = leftChildIndex(index)
        let rightChildIndex = rightChildIndex(index)
        
        if leftChildIndex <= count && policy(elements[leftChildIndex], elements[index]) {
            swapIndex = leftChildIndex
        }
        
        if rightChildIndex <= count && policy(elements[rightChildIndex], elements[swapIndex]) {
            swapIndex = rightChildIndex
        }
        
        if swapIndex != index {
            elements.swapAt(index, swapIndex)
            swimDown(from: swapIndex)
        }
    }
}

let n: Int = Int(readLine()!)!
var lectures: [Time] = []

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append(Time(start: input[0], end: input[1]))
}

// 수업을 시작 시간 기준으로 정렬
lectures.sort { $0.start < $1.start }

var heap = Heap<Time>(<)
var answer: Int = 0

for lecture in lectures {
    // 현재 수업이 시작되기 전에 끝나는 수업들을 힙에서 제거
    while let earliest = heap.peek, earliest.end <= lecture.start {
        heap.pop()
    }

    // 현재 수업을 힙에 추가
    heap.push(of: lecture)

    // 최대 강의실 사용 개수 갱신
    answer = max(answer, heap.count)
}

print(answer)