//
//  1812. 判断国际象棋棋盘中一个格子的颜色.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/12/8.
//

import Foundation

func squareIsWhite(_ coordinates: String) -> Bool {
    let chars = Array(coordinates)
    let x = chars[0].asciiValue! - 97
    let y = chars[1].wholeNumberValue! - 65
    
    if x % 2 == 0 {
        return y % 2 == 0 ? false : true
    } else {
        return y % 2 == 0 ? true : false
    }
}
