//
//  354. 俄罗斯套娃信封问题.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/5.
//

import Foundation

func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    let envelopes = envelopes.sorted {
        $0[0] < $1[0] ? true : ($0[0] == $1[0] ? ($0[1] > $1[1]) : false)
    }
    
    var tops = [envelopes[0][1]]
    
    for i in 1 ..< envelopes.count {
        let k = envelopes[i][1]
        
        if k > tops.last! {
            tops.append(k)
            continue
        }
        
        var left = 0
        var right = tops.count
        
        while left < right {
            let mid = left + (right - left) / 2
            let m = tops[mid]
            
            if m < k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        tops[left] = k
    }
    
    return tops.count
}
