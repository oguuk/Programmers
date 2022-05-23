func solution(_ arr:[Int]) -> [Int] {
    var arr2 = arr
    arr2.remove(at:arr2.index(of:arr2.min()!)!)
    return arr2.isEmpty ? [-1]:arr2
}
