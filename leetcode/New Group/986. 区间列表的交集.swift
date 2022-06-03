//
//  986. 区间列表的交集.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/2.
//

import Foundation

func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    if firstList.isEmpty || secondList.isEmpty {
        return []
    }
    
    var i = 0
    var j = 0
    var ans: [[Int]] = []
    
    while i < firstList.count, j < secondList.count {
        if firstList[i][1] < secondList[j][0] {
            i += 1
            continue
        }
        
        if firstList[i][0] > secondList[j][1] {
            j += 1
            continue
        }
        
        ans.append([max(firstList[i][0], secondList[j][0]),
                    min(firstList[i][1], secondList[j][1])])
        
        firstList[i][1] > secondList[j][1] ? (j += 1) : (i += 1)
    }
    
    return ans
}
