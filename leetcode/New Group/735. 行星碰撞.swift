//
//  735. 行星碰撞.swift
//  leetcode
//
//  Created by 张欣宇 on 2022/7/14.
//

import Foundation

func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var ans: [Int] = []
    for asteroid in asteroids {
        if asteroid > 0 {
            ans.append(asteroid)
            continue
        }
        
        while !ans.isEmpty,
           ans.last! > 0,
           ans.last! < abs(asteroid) {
            ans.removeLast()
        }
        
        if ans.isEmpty || ans.last! < 0 {
            ans.append(asteroid)
        } else if ans.last! == abs(asteroid) {
            ans.removeLast()
        }
    }
    
    return ans
}
