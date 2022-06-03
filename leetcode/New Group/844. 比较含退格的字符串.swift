//
//  844. 比较含退格的字符串.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/2.
//

import Foundation

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    var stackS: [Character] = []
    var stackT: [Character] = []
    
    for c in Array(s) {
        if c != "#" {
            stackS.append(c)
            continue
        }
        
        if !stackS.isEmpty {
            stackS.removeLast()
        }
    }
    
    for c in Array(t) {
        if c != "#" {
            stackT.append(c)
            continue
        }
        
        if !stackT.isEmpty {
            stackT.removeLast()
        }
    }
    
    return String(stackS) == String(stackT)
}
