//
//  953. 验证外星语词典.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/17.
//

import Foundation

func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    var map: [Character: Int] = [:]
    var i = 0
    for c in order {
        map[c] = i
        i += 1
    }
    
    for i in 1 ..< words.count {
        var chars1 = ArraySlice(words[i - 1])
        var chars2 = ArraySlice(words[i])
        
        while !chars1.isEmpty, !chars2.isEmpty,map[chars1.first!] == map[chars2.first!] {
            chars1.removeFirst()
            chars2.removeFirst()
        }
        
        if chars1.isEmpty, chars2.isEmpty {
            continue
        }
        
        if chars1.isEmpty {
            return false
        }
        
        if chars2.isEmpty {
            continue
        }
        
        if map[chars1.first!]! < map[chars2.first!]! {
            continue
        } else {
            return false
        }
    }
    
    return true
}
