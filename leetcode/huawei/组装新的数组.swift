//
//  组装新的数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func zuzhuangxindeshuzu() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let nums = line1.split(separator: " ").map { Int($0)! }
        let n = nums.count
        let m = Int(line2)!
        let range = (m - nums[0] + 1 ... m)
        var ans = 0
        
        func backtracking(_ sum: Int, _ begin: Int) {
            
            if sum > m { return }
            
            if range.contains(sum) {
                ans += 1
                return
            }
            
            for i in begin ..< n {
                backtracking(sum + nums[i], i)
            }
        }
        
        backtracking(0, 0)
        
        print(ans)
    }
}
