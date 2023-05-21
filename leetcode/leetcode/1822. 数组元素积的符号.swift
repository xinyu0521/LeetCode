//
//  1822. 数组元素积的符号
//  leetcode
//
//  Created by 张欣宇 on 2022/10/27.
//

import Foundation

func arraySign(_ nums: [Int]) -> Int {
    nums.reduce(into: 1) {
        $0 *= $1 > 0 ? 1 : ($1 < 0 ? -1 : 0)
    }
}
