//
//  2287. 重排字符形成目标字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/13.
//

import Foundation

func rearrangeCharacters(_ s: String, _ target: String) -> Int {
    let cntS = s.reduce(into: [Character: Int]()) {
        $0[$1, default: 0] += 1
    }
    
    let cntT = target.reduce(into: [Character: Int]()) {
        $0[$1, default: 0] += 1
    }
    
    var ans = Int.max
    
    for (key, val) in cntT {
        if let n = cntS[key] {
            ans = min(ans, n / val)
        } else {
            return 0
        }
    }
    
    return ans
}
