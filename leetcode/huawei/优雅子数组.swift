//
//  优雅子数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/23.
//

import Foundation

func youyazishuzu() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let nk = line1.split(separator: " ").map { Int($0)! }
        let nums = line2.split(separator: " ").map { Int($0)! }
        let n = nk[0]
        let k = nk[1]
        
        var cnt: [Int: Int] = [:]
        var l = 0
        var r = 0
        var ans = 0
        
        while l < n && r < n {
            let num = nums[r]
            cnt[num, default: 0] += 1
            
            while cnt[num, default: 0] == k {
                ans += n - r
                cnt[nums[l], default: 0] -= 1
                l += 1
            }
            r += 1
        }
        
        print(ans)
    }
}
