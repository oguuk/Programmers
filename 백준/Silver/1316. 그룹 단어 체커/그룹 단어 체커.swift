var answer = 0
for _ in 1...Int(readLine()!)! {
    var flag = 1
    var array = [Character]()
    for char in readLine()! {
        if array.contains(char) {
            if array.last != char {
                flag = 0
                break
            }
        }
        array.append(char)
    }
    if flag == 1 { answer += 1 }
}
print(answer)
