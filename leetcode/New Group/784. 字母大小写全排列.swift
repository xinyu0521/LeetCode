//
//  784. 字母大小写全排列.swift
//  leetcode
//
//  Created by zhanx630 on 2022/5/10.
//

import Foundation

func letterCasePermutation(_ s: String) -> [String] {
    var chars = Array<Character>(s)
    let charIndices = chars.indices.filter { chars[$0].isLetter }
    var ans: [String] = []
    
    func backtracking(_ start: Int) {
        ans.append(String(chars))
        for i in start ..< charIndices.count {
            let index = charIndices[i]
            chars[index] = chars[index].isUppercase ? Character(chars[index].lowercased()) : Character(chars[index].uppercased())
            backtracking(i + 1)
            chars[index] = chars[index].isUppercase ? Character(chars[index].lowercased()) : Character(chars[index].uppercased())
        }
    }
    
    backtracking(0)
    
    return ans
}
