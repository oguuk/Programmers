
let nk: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (nk[0], nk[1])
if K < 5 {
    print(0)
} else if K == 26 {
    print(N)
} else {
    var words = [Int]()
    for _ in 0..<N {
        let word = readLine()!
        var bitmask = 0
        for char in word {
            bitmask |= (1 << (char.asciiValue! - Character("a").asciiValue!))
        }
        words.append(bitmask)
    }

    var maxCount = 0
    let baseMask = (1 << (Character("a").asciiValue! - Character("a").asciiValue!)) |
                   (1 << (Character("n").asciiValue! - Character("a").asciiValue!)) |
                   (1 << (Character("t").asciiValue! - Character("a").asciiValue!)) |
                   (1 << (Character("i").asciiValue! - Character("a").asciiValue!)) |
                   (1 << (Character("c").asciiValue! - Character("a").asciiValue!))

    func dfs(_ mask: Int, _ index: Int, _ count: Int) {
        if count == K - 5 {
            maxCount = max(maxCount, words.filter { ($0 & ~mask) == 0 }.count)
            return
        }

        for i in index..<26 {
            if mask & (1 << i) == 0 {
                dfs(mask | (1 << i), i + 1, count + 1)
            }
        }
    }
    
    dfs(baseMask, 0, 0)
    print(maxCount)
}