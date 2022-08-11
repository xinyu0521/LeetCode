//
//  1417. 重新格式化字符串.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/8/11.
//

import Foundation

func reformat(_ s: String) -> String {
    var nums: [Character] = []
    var chars: [Character] = []
    
    for c in s {
        if c.isNumber {
            nums.append(c)
        } else {
            chars.append(c)
        }
    }
    
    if abs(nums.count - chars.count) > 1 {
        return ""
    }
    
    var ans = ""
    
    for (c1, c2) in zip(nums, chars) {
        ans.append(c1)
        ans.append(c2)
    }
    
    if nums.count > chars.count {
        return ans + String(nums.last!)
    } else if nums.count < chars.count {
        return String(chars.last!) + ans
    }
    
    return ans
}
