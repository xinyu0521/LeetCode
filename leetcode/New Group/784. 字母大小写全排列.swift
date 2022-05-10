//
//  784. 字母大小写全排列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/10.
//

import Foundation

func letterCasePermutation(_ s: String) -> [String] {
    let chars = Array<Character>(s)
    var ans: [String] = []
    
    func backtracking(_ index: Int, _ str: [Character]) {
        
        if str.count == chars.count {
            ans.append(String(str))
            return
        }
        
        var str = str
        var char = chars[index]
        
        
        if (48 ... 57).contains(char.asciiValue!) {
            str.append(char)
            backtracking(index + 1, str)
            return
        }
        
        char = Character(char.uppercased())
        str.append(char)
        backtracking(index + 1, str)
        
        str.removeLast()
        char = Character(char.lowercased())
        str.append(char)
        backtracking(index + 1, str)
    }
    
    backtracking(0, [])
    
    return ans
}
