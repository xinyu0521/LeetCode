//
//  699. 掉落的方块.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/28.
//

import Foundation

func fallingSquares(_ positions: [[Int]]) -> [Int] {
    var ans: [Int] = []
    var ranges: [(begin: Int, end: Int, height: Int)] = []
    var maxHeight = 0
    for position in positions {
        let begin = position[0]
        let end = position[0] + position[1]
        let height = position[1]

        var fallHeight = 0

        for range in ranges {
            if end <= range.begin || begin >= range.end {
                continue
            }

            fallHeight = max(fallHeight, range.height)
        }

        let curHeight = fallHeight + height
        ranges.append((begin, end, curHeight))
        maxHeight = max(maxHeight, curHeight)

        ans.append(maxHeight)
    }

    return ans
}
