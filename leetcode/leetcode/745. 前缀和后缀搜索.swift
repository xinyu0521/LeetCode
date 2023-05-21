//
//  745. 前缀和后缀搜索.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/30.
//

import Foundation

class WordFilter {
    
    var map: [String: Int] = [:]

    init(_ words: [String]) {

        for index in 0 ..< words.count {
            
            var prefixes: [Substring] = []
            var suffixes: [Substring] = []
            let word = words[index]
            for i in 0 ... word.count {
                prefixes.append(word[word.startIndex ..< word.index(word.startIndex, offsetBy: i)])
                suffixes.append(word[word.index(word.endIndex, offsetBy: -i) ..< word.endIndex])
            }
            
            for pre in prefixes {
                for suf in suffixes {
                    let key = pre + "_" + suf
                    map[String(key)] = index
                }
            }
        }
    }
    
    func f(_ prefix: String, _ suffix: String) -> Int {
        let key = prefix + "_" + suffix
        return map[key] ?? -1
    }
}
