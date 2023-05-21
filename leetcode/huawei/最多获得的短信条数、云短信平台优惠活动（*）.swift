//
//  最多获得的短信条数、云短信平台优惠活动.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/27.
//

import Foundation

func duanxinhuodong() {
    while let line1 = readLine(),
          let line2 = readLine() {
        let m = Int(line1)!
        let ps = line2.split(separator: " ").map { Int($0)! }
        
        var dp = Array(repeating: 0, count: m + 1)
        for i in 1 ... ps.count {
            for j in 1 ... m where j >= i {
                dp[j] = max(dp[j], dp[j - i] + ps[i - 1])
            }
        }
        
        print(dp.last!)
    }
}
