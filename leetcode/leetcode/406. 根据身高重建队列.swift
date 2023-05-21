//
//  406. 根据身高重建队列.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/9.
//

import Foundation

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    let people = people.sorted {
        $0[0] == $1[0] ? $0[0] < $1[1] : $0[0] > $1[0]
    }
    
    var ans: [[Int]] = []
    
    for person in people {
        ans.insert(person, at: person[1])
    }
    
    return ans
}
