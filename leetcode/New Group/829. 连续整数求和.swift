//
//  829. 连续整数求和.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/3.
//

import Foundation

/**

 class Solution {
     public int consecutiveNumbersSum(int n) {
         int ans = 0; n *= 2;
         for (int k = 1; k * k < n; k++) {
             if (n % k != 0) continue;
             if ((n / k - (k - 1)) % 2 == 0) ans++;
         }
         return ans;
     }
 }

 */

func consecutiveNumbersSum(_ n: Int) -> Int {
    var ans = 0
    let n = n * 2
    var k = 1

    while k * k < n {
        defer { k += 1 }
        if n % k != 0 { continue }
        if (n / k - (k - 1)) % 2 == 0 { ans += 1 }
    }
    
    return ans
}
