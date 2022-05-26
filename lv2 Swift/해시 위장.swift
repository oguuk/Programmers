import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var closet = [String:[String]]()
    var ans = 0
    
    for cloth in clothes {
        if closet[cloth[1]] == nil {closet[cloth[1]] = [cloth[0]]}
        else { closet[cloth[1]]!.append(cloth[0]) }
    }
    
    let closetValueIsCount = closet.mapValues{$0.count}.values
    
    return closetValueIsCount.reduce(1){$0*($1+1)} - 1
}
