//
//  744. 寻找比目标字母大的最小字母.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/3.
//

import Foundation

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    if target >= letters[letters.count - 1] {
        return letters[0]
    }

    var start = 0
    var end = letters.count

    while start < end {
        let mid = (start + end) >> 1
        if target >= letters[mid] {
            start = mid + 1
        } else {
            end = mid
        }
    }

    return letters[start]
}
