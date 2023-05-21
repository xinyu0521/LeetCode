//
//  672. 灯泡开关 Ⅱ.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/9/17.
//

import Foundation

func flipLights(_ n: Int, _ presses: Int) -> Int {
    if presses == 0 { return 1 }
    if n == 1 { return 2 }
    else if n == 2 { return presses == 1 ? 3 : 4 }
    else { return presses == 1 ? 4 : presses == 2 ? 7 : 8 }
}
