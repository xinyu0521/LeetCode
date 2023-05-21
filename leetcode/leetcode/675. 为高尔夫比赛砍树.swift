//
//  675. 为高尔夫比赛砍树.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/23.
//

import Foundation

func cutOffTree(_ forest: [[Int]]) -> Int {
    let n = forest.count
    let m = forest[0].count

    var heights: [Int] = []
    for i in 0 ..< n {
        for j in 0 ..< m where forest[i][j] > 1 {
            heights.append(forest[i][j])
        }
    }
    heights.sort()
    
    func bfs(_ start: (Int, Int), _ target: Int) -> (Int, (Int, Int)) {
        
        if forest[start.0][start.1] == target {
            return (0, (start.0, start.1))
        }
        
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var queue: ArraySlice<(Int, Int)> = [start]
        visited[start.0][start.1] = true
        var step = 0
        while !queue.isEmpty {
            step += 1
            var count = queue.count
            while count > 0 {
                count -= 1
                let point = queue.removeFirst()
                let newPoints = [(point.0 + 1, point.1),
                                 (point.0 - 1, point.1),
                                 (point.0, point.1 + 1),
                                 (point.0, point.1 - 1)]
                for newPoint in newPoints where
                    (0 ..< n).contains(newPoint.0) &&
                    (0 ..< m).contains(newPoint.1) &&
                    visited[newPoint.0][newPoint.1] == false &&
                    forest[newPoint.0][newPoint.1] != 0
                {
                    if forest[newPoint.0][newPoint.1] == target {
                        return (step, (newPoint.0, newPoint.1))
                    }
                    queue.append(newPoint)
                    visited[newPoint.0][newPoint.1] = true
                }
            }
        }
        
        return (-1, (0, 0))
    }
    
    var ans = 0
    var start = (0, 0)
    for height in heights {
        let res = bfs(start, height)
        if res.0 == -1 {
            return -1
        }
        ans += res.0
        start = res.1
    }
    
    return ans
}
