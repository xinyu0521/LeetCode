//
//  190. 颠倒二进制位 .swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/13.
//

import Foundation

func reverseBits(_ n: Int) -> Int {
    var ans = 0
    var mask = 1
    for _ in 0 ..< 32 {
        if (mask & n) != 0 {
            ans = ans << 1 + 1
        } else {
            ans = ans << 1
        }
        mask = mask << 1
    }
    
    return ans
}
