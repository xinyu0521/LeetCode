//
//  478. 在圆内随机生成点.swift
//  leetcode
//
//  Created by zhanx630 on 2022/6/5.
//

import Foundation

class SolutionRandPoint {
    private let radius: Double
    private let x_center: Double
    private let y_center: Double
//    private let random: 

    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.x_center = x_center
        self.y_center = y_center
        
    }
    
    func randPoint() -> [Double] {
        while true {
            let x = Double.random(in: -radius ... radius)
            let y = Double.random(in: -radius ... radius)
            
            if abs(x) * abs(x) + abs(y) * abs(y) <= radius * radius {
                return [x_center + x, y_center + y]
            }
        }
    }
}
