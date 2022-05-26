import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    return caculate(numbers,target,0,0)
}

func caculate(_ numbers:[Int],_ target:Int,_ value:Int,_ index:Int) -> Int{
    if index == numbers.count{
        if value == target {return 1}
        else {return 0}
    }
    
    return caculate(numbers,target,value+numbers[index],index+1) +
           caculate(numbers,target,value-numbers[index],index+1)
}
