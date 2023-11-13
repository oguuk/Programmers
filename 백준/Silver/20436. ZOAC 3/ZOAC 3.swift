let vowels: [String: (r: Int, c: Int)] = [
    "y": (0, 5), "u": (0, 6), "i": (0, 7), "o": (0, 8), "p": (0, 9),
    "h": (1, 5), "j": (1, 6), "k": (1, 7), "l": (1, 8),
    "b": (2, 4), "n": (2, 5), "m": (2, 6)
]

let consonants: [String: (r: Int, c: Int)] = [
    "q": (0, 0), "w": (0, 1), "e": (0, 2), "r": (0, 3), "t": (0, 4),
    "a": (1, 0), "s": (1, 1), "d": (1, 2), "f": (1, 3), "g": (1, 4),
    "z": (2, 0), "x": (2, 1), "c": (2, 2), "v": (2, 3)
]

var answer: Int = 0
var l: (r: Int, c: Int) = (0, 0)
var r: (r: Int, c: Int) = (0, 0)

let input: [String] = readLine()!.split(separator: " ").map(String.init)
var string: String = readLine()!
let sl = input[0], sr = input[1]

l = consonants[sl]!
r = vowels[sr]!

func distance(_ r: (r: Int, c: Int), _ l: (r: Int, c: Int)) -> Int {
    return abs(r.r - l.r) + abs(r.c - l.c)
}

for c in string {
    let s = String(c)
    if let target = consonants[String(c)] {
        answer += distance(l, target) + 1
        l = target
    } else {
        guard let target = vowels[String(c)] else { continue }
        answer += distance(r, target) + 1
        r = target
    }
}

print(answer)