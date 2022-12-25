import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    let str = "\(num)"
    for (i, v) in str.enumerated() {
        if String(v) == "\(k)" { return i + 1 }
    }
    return -1
}