let record = readLine()!
var list = [[Int]]()
let convertToNum: [Character : Int] = ["q":0, "u":1, "a":2, "c":3, "k":4]
var isCorrect = true


for r in record {
    let index = convertToNum[r]!
    
    var insert = false
    
    for i in 0..<list.count {
        if list[i].last! == (index == 0 ? 4 : index - 1) {
            list[i].append(index)
            insert = true
            break
        }
    }
    
    if !insert {
        if index == 0 {
            list.append([0])
        } else {
            isCorrect = false
            break
        }
    }
}

for i in 0..<list.count {
    if let last = list[i].last, last != 4 { isCorrect = false }
}

print(isCorrect ? list.count : -1)