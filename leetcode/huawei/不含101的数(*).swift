//
//  不含101的数.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func buhan101() {
    while let line = readLine() {
        let lr = line.split(separator: " ").map { Int($0)! }
        let l = lr[0]
        let r = lr[1]
        
        let lb = String(l - 1, radix: 2).map { Int(String($0))!}
        let rb = String(r, radix: 2).map { Int(String($0))!}
        
        var dpl = Array( repeating: Array(repeating: Array(repeating: 0, count: 2), count: 2), count: lb.count)
        var dpr = Array( repeating: Array(repeating: Array(repeating: 0, count: 2), count: 2), count: rb.count)

        func dfs(_ i: Int, _ limit: Bool, _ nums: [Int], _ pre: Int, _ prepre: Int, _ dp: inout [[[Int]]] ) -> Int {
            if i == nums.count {
                return 1
            }
            
            if !limit && dp[i][pre][prepre] > 0 {
                return dp[i][pre][prepre]
            }
            
            var res = 0
            let r = limit ? nums[i] : 1
            for b in 0 ... r {
                if b == 1, pre == 0, prepre == 1 {
                    continue
                }
                res += dfs(i + 1, limit && b == r , nums, b, pre, &dp)
            }
            
            if !limit {
                dp[i][pre][prepre] = res
            }
            return res
        }
        
        let diff = dfs(0, true, rb, 0, 0, &dpr) - dfs(0, true, lb, 0, 0, &dpl)
        print(diff)
    }
}
