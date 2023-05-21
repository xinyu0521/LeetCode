//
//  查找树中元素.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func chazhaoshuzhongyuansu() {
    
    while let line = readLine() {
        let n = Int(line)!
        var nodes: [[Int]] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let node = line.split(separator: " ").map { Int($0)! }
                nodes.append(node)
            }
        }
        
        var matrix: [[Int]] = []
        
        func dfs(_ node: [Int], _ l: Int) {
            if l >= matrix.count {
                matrix.append([])
            }
            
            matrix[l].append(node[0])
            
            for i in node.dropFirst() {
                let n = nodes[i]
                dfs(n, l + 1)
            }
        }
        
        dfs(nodes[0], 0)
        
        
        if let line = readLine() {
            let target = line.split(separator: " ").map { Int($0)! }
            print(matrix[target[0]][target[1]])
        }
    }
}
