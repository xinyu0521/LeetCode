//
//  1234. 替换子串得到平衡字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/13.
//

import Foundation

func balancedString(_ s: String) -> Int {
    let chars = Array(s)
    var cnt = chars.reduce(into: [Character: Int]()) {
        $0[$1, default: 0] += 1
    }
    
    let n = chars.count
    let t = n / 4
    var r = 0
    var ans = n
    
    for l in 0 ..< n {
        while r < n,
              !check() {
            cnt[chars[r], default: 0] -= 1
            r += 1
        }
        
        if !check() {
            break
        }
        
        ans = min(ans, r - l)
        cnt[chars[l], default: 0] += 1
    }
    
    func check() -> Bool {
        !cnt.contains { (_, val) in val > t }
    }
    
    return ans
}
