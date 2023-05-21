//
//  1124. 表现良好的最长时间段.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/14.
//

import Foundation

func longestWPI(_ hours: [Int]) -> Int {
    let n = hours.count
    var st = [0]
    var s = [0]
    
    for i in hours.indices {
        let a = s.last! + (hours[i] > 8 ? 1 : -1)
        s.append(a)
        if a < s[st.last!] {
            st.append(i + 1)
        }
    }
    
    var ans = 0
    
    for j in (1...n).reversed() {
        while let last = st.last, s[last] < s[j] {
            ans = max(ans, j - st.removeLast())
        }
    }
    
    return ans
}
