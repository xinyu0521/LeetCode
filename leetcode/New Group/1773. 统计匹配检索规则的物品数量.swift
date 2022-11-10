//
//  1773. 统计匹配检索规则的物品数量.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/29.
//

import Foundation

func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
    let i = ruleKey == "type" ? 0 : ruleKey == "color" ? 1 : 2
    return items.reduce(into: 0) {
        if $1[i] == ruleValue {
            $0 += 1
        }
    }
}
