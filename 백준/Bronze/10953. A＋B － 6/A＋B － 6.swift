for _ in 0..<Int(readLine()!)! {
    let nums = readLine()!.split(separator: ",").map { Int(String($0))! }
    print(nums.reduce(0, +))
}