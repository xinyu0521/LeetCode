//
//  17. 电话号码的字母组合.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/20.
//

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    let map: [Character: [Character]] = ["2": ["a", "b", "c"],
                                         "3": ["d", "e", "f"],
                                         "4": ["g", "h", "i"],
                                         "5": ["j", "k", "l"],
                                         "6": ["m", "n", "o"],
                                         "7": ["p", "q", "r", "s"],
                                         "8": ["t", "u", "v"],
                                         "9": ["s", "x", "y", "z"]]
    
    var digitsChars = Array(digits)
    var str = ""
    var index = -1
    var res: [String] = []
    
    func backtracking() {
        if index == digitsChars.count - 1 {
            res.append(str)
            return
        }
        
        index += 1
        for c in map[digitsChars[index]]! {
            str.append(c)
            backtracking()
            str.removeLast()
        }
        index -= 1
    }
    
    backtracking()
    return res
}
