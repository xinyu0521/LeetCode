//
//  868. 二进制间距.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/24.
//

import Foundation

func binaryGap(_ n: Int) -> Int {
    var res = 0
    var cur = 0
    var index = 1
    var i = 1
    while i < n {
        if i & n > 0 {
            if cur != 0 {
                res = max(res, index - cur)
            }
            
            cur = index
        }
        
        index += 1
        i = i << 1
    }
    
    return res
}
