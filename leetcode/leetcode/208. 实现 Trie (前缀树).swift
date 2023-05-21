//
//  208. 实现 Trie (前缀树).swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/23.
//

import Foundation

class MYTreeNode {
    var isWord: Bool
    var children: [MYTreeNode?]
    
    init(isWord: Bool) {
        self.isWord = isWord
        self.children = Array(repeating: nil, count: 26)
    }
}

class Trie {
    
    let root = MYTreeNode(isWord: false)

    init() {
        
    }
    
    func insert(_ word: String) {
        var tree = root
        for char in word {
            let index = Int(char.asciiValue!) - 97
            var node = tree.children[index]
            if node == nil {
                node = MYTreeNode(isWord: false)
                tree.children[index] = node
            }
            tree = node!
        }
        
        tree.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = search(word) else {
            return false
        }
        return node.isWord
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return search(prefix) != nil
    }
    
    private func search(_ str: String) -> MYTreeNode? {
        var tree = root
        for char in str {
            let index = Int(char.asciiValue!) - 97
            let node = tree.children[index]
            if node == nil {
                return nil
            }
            tree = node!
        }
        
        return tree
    }
}
