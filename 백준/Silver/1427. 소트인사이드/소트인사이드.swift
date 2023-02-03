print(readLine()!.map { Int(String($0))! }.sorted(by: >).map { String($0) }.joined())
