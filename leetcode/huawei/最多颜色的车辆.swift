//
//  最多颜色的车辆.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func zuiduoyansecheliang() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let nums = line1.split(separator: " ").map { Int($0)! }
        let n = nums.count
        let w = Int(line2)!
        
        var cnt: [Int] = [0, 0, 0]
        var maxN = 0
        
        for i in 0 ..< w {
            cnt[nums[i]] += 1
            maxN = max(maxN, cnt[nums[i]])
        }
        
        for i in 0 ..< n - w {
            let j = i + w
            cnt[nums[i]] -= 1
            cnt[nums[j]] += 1
            maxN = max(maxN, cnt[nums[j]])
        }
        
        print(maxN)
    }
}
