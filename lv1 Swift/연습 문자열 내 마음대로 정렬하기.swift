import Foundation
func solution(_ strings:[String], _ n:Int) -> [String] {
    let index = strings[0].index(strings[0].startIndex, offsetBy: n)
    var arr = strings.sorted(by:<)
    arr = arr.sorted(by: {$0[index] < $1[index]})

    return arr
}
