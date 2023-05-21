//
//  937. 重新排列日志文件.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/3.
//

import Foundation

func reorderLogFiles(_ logs: [String]) -> [String] {
    var letters: [String] = []
    var nums: [String] = []
    
    for log in logs {
        var i = 0
        find: for c in log {
            if c == " " {
                i += 1
                break find
            }
            i += 1
        }
        let str = log[log.index(log.startIndex, offsetBy: i)]
        if str.asciiValue! > 57 {
            letters.append(log)
        } else {
            nums.append(log)
        }
    }
    
    letters.sort { s1, s2 in
        var i = 0
        for c in s1 {
            if c == " " {
                i += 1
                break
            }
            i += 1
        }
        
        var j = 0
        for c in s2 {
            if c == " " {
                j += 1
                break
            }
            j += 1
        }
        
        let str1 = s1.suffix(from: s1.index(s1.startIndex, offsetBy: i))
        let str2 = s2.suffix(from: s2.index(s2.startIndex, offsetBy: j))
        
        if str1 == str2 {
            return s1.prefix(upTo: s1.index(s1.startIndex, offsetBy: i)) < s2.prefix(upTo: s2.index(s2.startIndex, offsetBy: j))
        }
        
        return str1 < str2
    }
    
    return letters + nums
}
