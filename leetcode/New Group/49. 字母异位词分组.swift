//
//  49. 字母异位词分组.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/21.
//

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map: [String: [String]] = [:]
    for str in strs {
        let sortedStr = String(str.sorted())
        if map[sortedStr] == nil {
            map[sortedStr] = []
        }
        map[sortedStr]?.append(str)
    }
    return map.reduce(into: [[String]]()) {
        $0.append($1.value)
    }
}
