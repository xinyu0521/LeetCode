//
//  1781. 所有子字符串美丽值之和.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/12.
//

import Foundation

func beautySum(_ s: String) -> Int {
    let chars = Array(s)
    let n = chars.count
    var ans = 0
    
    for i in 0 ..< n {
        var cnt: [Int] = Array(repeating: 0, count: 26)
        var maxCount = 0
        for j in i ..< n {
            let c = chars[j]
            let index = Int(c.asciiValue!) - 97
            cnt[index] += 1
            maxCount = max(maxCount, cnt[index])
            var minCount = Int.max
            for m in cnt where m != 0 {
                minCount = min(minCount, m)
            }
            ans += maxCount - minCount
        }
    }
    
    return ans
}
