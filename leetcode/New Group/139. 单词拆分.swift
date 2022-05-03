//
//  139. 单词拆分.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/16.
//

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let set = Set(wordDict)
    
    var cache: [String: Bool] = [:]
    
    func dp(_ str: String) -> Bool {
        if let re = cache[str] {
            return re
        }
        
        if set.contains(str) {
            cache[str] = true
            return true
        }
        
        for i in 1 ..< str.count {
            
            if set.contains(String(str.prefix(i))), dp(String(str.suffix(str.count - i))) {
                cache[str] = true
                return true
            }
        }
        
        cache[str] = false
        return false
    }
    
    return dp(s)
}
