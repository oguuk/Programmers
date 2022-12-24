import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    return (0..<num_list.count/n).map { Array(num_list[n*$0..<n*$0+n]) }
}