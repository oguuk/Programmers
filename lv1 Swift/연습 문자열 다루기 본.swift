func solution(_ s:String) -> Bool {
    if s.count < 4 || s.count > 6 || s.count == 5{
        return false
    }
    
    for c in s {
        if c.isLetter {
            return false
        }
    }
    return true
}
