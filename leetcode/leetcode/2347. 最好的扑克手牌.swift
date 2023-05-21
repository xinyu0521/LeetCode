//
//  2347. 最好的扑克手牌.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/2/20.
//

import Foundation

func bestHand(_ ranks: [Int], _ suits: [Character]) -> String {
    if suits[0] == suits[1],
       suits[0] == suits[2],
       suits[0] == suits[3],
       suits[0] == suits[4] {
        return "Flush"
    }
    
    let cnt = ranks.reduce(into: [Int](repeating: 0, count: 14)) {
        $0[$1] += 1
    }
    
    if let m = cnt.max() {
        if m >= 3 {
            return "Three of a Kind"
        }
        
        if m == 2 {
            return "Pair"
        }
    }
    
    return "High Card"
}
