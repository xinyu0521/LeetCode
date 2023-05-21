//
//  1807. 替换字符串中的括号内容.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/12.
//

import Foundation

func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
    let map = knowledge.reduce(into: [String: String]()) {
        $0[$1[0]] = $1[1]
    }
    
    var iskey = false
    var key = ""
    var ans = ""
    
    for c in s {
        if c == "(" {
            iskey = true
        } else if c == ")" {
            ans += map[key, default: "?"]
            key = ""
            iskey = false
        } else {
            if iskey == true {
                key.append(c)
            } else {
                ans.append(c)
            }
        }
    }
    
    return ans
}
