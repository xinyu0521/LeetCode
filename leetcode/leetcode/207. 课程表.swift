//
//  207. 课程表.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/22.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var ans = true
    var edges = Array(repeating: [Int](), count: numCourses)
    for prerequisite in prerequisites {
        edges[prerequisite[1]].append(prerequisite[0])
    }
    var visited = Array(repeating: 0, count: numCourses)
    for i in 0 ..< numCourses {
        if visited[i] == 0 {
            dfs(i)
        }
    }
    
    func dfs(_ i: Int) {
        visited[i] = 1
        for j in edges[i] {
            if visited[j] == 0 {
                dfs(j)
                if ans == false {
                    return
                }
            } else if visited[j] == 1 {
                ans = false
                return
            }
        }
        visited[i] = 2
    }
    
    return ans
}
