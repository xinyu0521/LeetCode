//
//  824. 山羊拉丁文.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/21.
//

import Foundation

func toGoatLatin(_ sentence: String) -> String {
    var res = ""
    let set = Set<Character>(["a", "o", "e", "i", "u", "A", "O", "E", "I", "U"])
    let words = sentence.split(separator: " ")
    for i in 0 ..< words.count {
        let word = words[i]
        var newWord = ""
        var firstChar: Character = "0"
        var isVowel = false
        for j in 0 ..< word.count {
            let char = word[word.index(word.startIndex, offsetBy: j)]
            if j == 0 {
                firstChar = char
                if set.contains(char) {
                    isVowel = true
                    newWord.append(char)
                }
                continue
            }
            
            newWord.append(char)
        }
        
        if !isVowel {
            newWord.append(firstChar)
        }
        
        newWord.append("ma")
        
        var m = i
        while m >= 0 {
            newWord.append("a")
            m -= 1
        }
        
        res.append(newWord + " ")
    }
    
    res.removeLast()
    
    return res
}
