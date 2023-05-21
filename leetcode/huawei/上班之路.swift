//
//  上班之路.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

enum Direction {
    case up
    case down
    case left
    case right
    case none
}

func shangbanzhilu() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let tc = line1.split(separator: " ").map { Int($0)! }
        let nm = line2.split(separator: " ").map { Int($0)! }
        let t = tc[0]
        let c = tc[1]
        let n = nm[0]
        let m = nm[1]
        var T = (0, 0)
        var S = (0, 0)
        
        var matrix: [[Character]] = []
        for i in 0 ..< n {
            if let line = readLine() {
                let chars = Array(line)
                matrix.append(chars)
                if let j = chars.firstIndex(of: "T") {
                    T = (i, j)
                }
                
                if let j = chars.firstIndex(of: "S") {
                    S = (i, j)
                }
            }
        }
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        
        func dfs(_ p: (Int, Int), _ d: Direction, _ tc: Int, _ cc: Int) -> Bool {
            if tc > t || cc > c { return false }
            if p == T { return true }
            visited[p.0][p.1] = true
            
            let nexts: [(Int, Int, Direction)] = [
                (p.0 + 1, p.1, .down),
                (p.0 - 1, p.1, .up),
                (p.0, p.1 + 1, .right),
                (p.0, p.1 - 1, .left)
            ]
            
            for next in nexts where (0..<n).contains(next.0) && (0..<m).contains(next.1) && !visited[next.0][next.1] {
                if dfs((next.0, next.1), next.2, tc + (next.2 == d ? 0 : 1), cc + (matrix[next.0][next.1] == "*" ? 1 : 0)) {
                    return true
                }
                visited[next.0][next.1] = false
            }
            
            return false
        }
        
        let ans = dfs(S, .none, 0, -1)
        
        print(ans ? "YES" : "NO")
        
    }
}
