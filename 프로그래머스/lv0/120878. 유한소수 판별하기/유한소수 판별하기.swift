import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    if (b / GCD(a, b)) < 2 { return 1 }
    return (2...(b / GCD(a, b)))
    .filter { (b / GCD(a, b)) % $0 == 0 }
    .filter { 
        if ($0 % 2 != 0 && $0 % 5 != 0)  { return true }
        else { return false }
    }
    .count > 0 ? 2 : 1
}

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a } 
    else { return GCD(b, a%b) }
}