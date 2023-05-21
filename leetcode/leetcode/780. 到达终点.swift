//
//  780. 到达终点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/10.
//

import Foundation

func reachingPoints(_ sx: Int, _ sy: Int, _ tx: inout Int, _ ty: inout Int) -> Bool {
    var tx = tx
    var ty = ty
    while sx < tx, sy < ty {
        if tx < ty {
            ty %= tx
        } else {
            tx %= ty
        }
    }
    
    if tx < sx || ty < sy { return false }
    
    return sx == tx ? (ty - sy) % sx == 0 : (tx - sx) % sy == 0
}
