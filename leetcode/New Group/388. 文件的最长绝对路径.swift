//
//  388. 文件的最长绝对路径.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/20.
//

import Foundation

func lengthLongestPath(_ input: String) -> Int {
    var maxL = 0
    let root = input.components(separatedBy: "\n")
    func maxLength(_ parentL: Int, _ subs: [String]) {
        if subs.isEmpty {
            return
        }
        var length = 0
        var subsubs: [String] = []
        for str in subs {
            if str.hasPrefix("\t") {
                subsubs.append(String(str.suffix(str.count - 1)))
            } else {
                if str.contains(".") {
                    maxL = max(maxL, parentL + str.count)
                } else {
                    if length == 0 {
                        length = str.count
                    } else {
                        maxLength(length + parentL + 1, subsubs)
                        length = str.count
                        subsubs.removeAll()
                    }
                }
            }
            
        }
        maxLength(length + parentL + 1, subsubs)
    }
    
    maxLength(0, root)
    return maxL
}
