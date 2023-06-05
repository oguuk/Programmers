//
//  main.swift
//  test
//
//  Created by 오국원 on 2023/06/04.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var parent = (0...nm[0]).map { Int(String($0))! }
var answer: [String] = []

func find(x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(x: parent[x])
    }
    return parent[x]
}

func union(x: Int, y: Int) {
    let a = find(x: x)
    let b = find(x: y)
    
    if a < b { parent[b] = a }
    else { parent[a] = b }
}

for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    switch input[0] {
    case 0:
        union(x: input[1], y: input[2])
    default:
        if find(x: input[1]) == find(x: input[2]) {
            answer.append("YES")
        } else {
            answer.append("NO")
        }
    }
}

answer.forEach { print($0) }
