func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let ans = arr.sorted().filter{ $0 % divisor == 0 }
    
    return ans.count == 0 ? [-1]:ans
}
