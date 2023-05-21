//
//  等和子数组最小和.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/22.
//

import Foundation

func denghezishuzu() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let n = Int(line1)!
        let nums = line2.split(separator: " ").map { Int($0)! }.sorted(by: >)
        let sum = nums.reduce(0, +)
        
        for k in (1 ... n).reversed() {
            if sum % k != 0 {
                continue
            }
            
            let target = sum / k
            if target < nums[0] {
                continue
            }
            
            if backtracking(0, Array(repeating: 0, count: k), target) {
                print(target)
                break
            }
        }
        
        func backtracking(_ index: Int, _ buckets: [Int], _ target: Int) -> Bool {
            if index == n { return true }
            let cur = nums[index]
            
            for i in buckets.indices {
                if i > 0 && buckets[i] == buckets[i - 1] {
                    continue
                }
                if buckets[i] + cur <= target {
                    var b = buckets
                    b[i] += cur
                    if backtracking(index + 1, b, target) {
                        return true
                    }
                }
            }
            
            return false
        }
    }
}





