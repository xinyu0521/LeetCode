//
//  676. 实现一个魔法字典.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/11.
//

import Foundation

class MagicDictionary {
    
    var words: [String] = []
    
    init() {

    }
    
    func buildDict(_ dictionary: [String]) {
        words = dictionary
    }
    
    func search(_ searchWord: String) -> Bool {
        for word in words where word.count == searchWord.count {
            let n = word.count
            var diff = 0
            let chars1 = Array(word)
            let chars2 = Array(searchWord)
            for i in 0 ..< n where chars1[i] != chars2[i] {
                diff += 1
            }
            
            if diff == 1 {
                return true
            }
        }
        
        return false
    }
}
