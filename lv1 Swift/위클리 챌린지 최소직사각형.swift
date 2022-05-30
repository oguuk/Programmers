import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var big = 0
    var small = 0
    
    for size in sizes {
        var i = size.first!
        var j = size.last!
        
        if i > j {
            if big < i { big = i }
            if small < j { small = j }
        } else {
            if big < j { big = j }
            if small < i { small = i }
        }
    }
    return big*small
}
