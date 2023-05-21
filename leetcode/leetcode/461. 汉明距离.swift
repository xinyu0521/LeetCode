//
//  461. 汉明距离.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/10/19.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    (x ^ y).nonzeroBitCount
}
