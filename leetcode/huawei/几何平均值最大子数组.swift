//
//  几何平均值最大子数组.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/25.
//

import Foundation

func jihepingjuzhizuidazishuzu() {
    while let line = readLine() {
        let nl = line.split(separator: " ").map { Int($0)! }
        let n = nl[0]
        let l = nl[1]
        var maxAvg: Double = 0
        var minAvg: Double = pow(10, 9)
        var nums: [Double] = []
        for _ in 0 ..< n {
            if let line = readLine() {
                let a = Double(line)!
                maxAvg = max(maxAvg, a)
                minAvg = min(minAvg, a)
                nums.append(Double(line)!)
            }
        }
        
        let diff = maxAvg / pow(10, 10)
        var ans = [0, 0]
        
        while maxAvg - minAvg >= diff {
            let mid = minAvg + (maxAvg - minAvg) / 2
            if check(mid) {
                minAvg = mid
            } else {
                maxAvg = mid
            }
        }
        
        func check(_ avg: Double) -> Bool {
            var fact: Double = 1
            for i in 0 ..< l {
                fact *= nums[i] / avg
            }
            
            if fact >= 1 {
                ans[0] = 0
                ans[1] = l
                return true
            }
            
            var pre_fact:Double = 1
            var min_fact: Double = pow(10, 9)
            var left_index = 0
            
            for i in l ..< n {
                fact *= nums[i] / avg
                pre_fact *= nums[i - l] / avg
                
                if pre_fact < min_fact {
                    min_fact = pre_fact
                    left_index = i - l
                }
                
                if fact / min_fact >= 1 {
                    ans[0] = left_index + 1
                    ans[1] = i - left_index
                    return true
                }
            }
            
            return false
        }
        print("\(ans[0]) \(ans[1])")
    }
}
