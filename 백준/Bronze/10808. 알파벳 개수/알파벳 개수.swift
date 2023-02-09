var alpha = Array(repeating: 0, count: 26)
readLine()!.map { alpha[Int(UnicodeScalar(String($0))!.value) - 97] += 1 }
alpha.forEach { print($0) }
