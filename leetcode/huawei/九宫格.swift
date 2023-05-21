//
//  九宫格.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/24.
//

import Foundation

func jiugognge() {
    while let line = readLine() {
        let nums = line.split(separator: " ").map { Int($0)! }
        let n = nums.count
        var ans: [[Int]] = []
        
        func dfs(_ used: Set<Int>, _ path: [Int]) {
            if path.count == n {
                if check(path) {
                    ans.append(path)
                }
                return
            }
            
            for num in nums {
                if used.contains(num) {
                    continue
                }
                dfs(used.union([num]), path + [num])
            }
        }
        
        func check(_ nums: [Int]) -> Bool {
            let r1 = nums[0] * nums[1] * nums[2]
            let r2 = nums[3] * nums[4] * nums[5]
            let r3 = nums[6] * nums[7] * nums[8]
            let r4 = nums[0] * nums[3] * nums[6]
            let r5 = nums[1] * nums[4] * nums[7]
            let r6 = nums[2] * nums[5] * nums[8]
            let r7 = nums[0] * nums[4] * nums[8]
            let r8 = nums[2] * nums[4] * nums[6]
            
            if r1 == r2,
               r1 == r3,
               r1 == r4,
               r1 == r5,
               r1 == r6,
               r1 == r7,
               r1 == r8 {
                return true
            }
            
            return false
        }
        
        dfs([], [])
        
        let strs = ans.map {
            $0.map { String($0) }.joined(separator: " ")
        }.sorted()
        
        for str in strs {
            print(str)
        }
    }
}
