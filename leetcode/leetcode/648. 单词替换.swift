//
//  648. 单词替换.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/7.
//

import Foundation

fileprivate class TrieNode {
    var isWord = false
    var children: [TrieNode?] = Array(repeating: nil, count: 26)
}

func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
    let root = TrieNode()
    for word in dictionary {
        let chars = Array(word)
        var curNode = root
        for i in 0 ..< chars.count {
            let c = chars[i]
            let index = Int(c.asciiValue! - Character("a").asciiValue!)
            if let node = curNode.children[index] {
                if i == chars.count - 1 {
                    node.isWord = true
                }
                curNode = node
                continue
            }
            
            let node = TrieNode()
            if i == chars.count - 1 {
                node.isWord = true
            }
            curNode.children[index] = node
            curNode = node
        }
    }
    
    var res = ""
    for word in sentence.split(separator: " ") {
        let chars = Array(word)
        var curNode = root
        var find = false
        for i in 0 ..< chars.count {
            let c = chars[i]
            let index = Int(c.asciiValue! - Character("a").asciiValue!)
            guard let node = curNode.children[index] else {
                break
            }
            if !node.isWord {
                curNode = node
                continue
            }
            find = true
            res.append(contentsOf: chars[0...i])
            break
        }
        
        if !find {
            res.append(String(word))
        }
        
        res.append(" ")
    }
    
    res.removeLast()
    
    return res
}
