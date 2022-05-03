//
//  417. 太平洋大西洋水流问题.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/27.
//

import Foundation

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    
    let m = heights.count
    let n = heights[0].count
    
    var ans: [[Int]] = []
    
    for x in 0 ..< m {
        for y in 0 ..< n {
            let can = canFlowBoth((x, y))
            if can.pacific, can.atlantic {
                ans.append([x, y])
            }
        }
    }
    
    func canFlowBoth(_ point: (x: Int, y: Int)) -> (pacific: Bool, atlantic: Bool) {
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        func dfs(_ point: (x: Int, y: Int)) -> (pacific: Bool, atlantic: Bool) {
            
            visited[point.x][point.y] = true
            
            var res = (pacific: false, atlantic: false)
            
            if point.x == 0 || point.y == 0 {
                res.pacific = true
            }
            
            if point.x == m - 1 || point.y == n - 1 {
                res.atlantic = true
            }
            
            let curHeight = heights[point.x][point.y]
            
            var topRes = (pacific: false, atlantic: false)
            var bottomRes = (pacific: false, atlantic: false)
            var leftRes = (pacific: false, atlantic: false)
            var rightRes = (pacific: false, atlantic: false)
            
            let topPiont = (x: point.x - 1, y: point.y)
            let bottomPiont = (x: point.x + 1, y: point.y)
            let leftPiont = (x: point.x, y: point.y - 1)
            let rightPiont = (x: point.x, y: point.y + 1)
            
            if canFlow(topPiont, height: curHeight) {
                topRes = dfs(topPiont)
            }
            
            if canFlow(bottomPiont, height: curHeight) {
                bottomRes = dfs(bottomPiont)
            }
            
            if canFlow(leftPiont, height: curHeight) {
                leftRes = dfs(leftPiont)
            }
            
            if canFlow(rightPiont, height: curHeight) {
                rightRes = dfs(rightPiont)
            }
            
            res.pacific = res.pacific || topRes.pacific || bottomRes.pacific || leftRes.pacific || rightRes.pacific
            
            res.atlantic = res.atlantic || topRes.atlantic || bottomRes.atlantic || leftRes.atlantic || rightRes.atlantic
            
            return res
        }
        
        func canFlow(_ point: (x: Int, y: Int), height: Int) -> Bool {
            if (0 ..< m).contains(point.x), (0 ..< n).contains(point.y), !visited[point.x][point.y], height >= heights[point.x][point.y] {
                return true
            }
    
            return false
        }
        
        return dfs(point)
    }
    
    return ans
}
