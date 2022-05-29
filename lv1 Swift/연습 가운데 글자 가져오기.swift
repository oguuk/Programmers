func solution(_ s:String) -> String {
    if s.count == 1 {
        return s
    }
    let end = s.index(s.startIndex, offsetBy: Int(s.count/2))
    let start = s.index(s.startIndex, offsetBy: Int(s.count/2-1))
    
    return s.count % 2 == 0 ? String(s[start...end]):String(s[end])
}
