//
//  2299. 强密码检验器 II.swift
//  leetcode
//
//  Created by 张欣宇 on 2023/1/19.
//

import Foundation

func strongPasswordCheckerII(_ password: String) -> Bool {
    if password.count < 8 {
        return false
    }
    
    var hasUp = false
    var hasLower = false
    var hasDigital = false
    var hasSpecial = false
    
    for (i, j) in zip(password, password.dropFirst()) {
        if i == j {
            return false
        }
        
        if i.isLowercase || j.isLowercase {
            hasLower = true
        }
        
        if i.isUppercase || j.isUppercase {
            hasUp = true
        }
        
        if i.isNumber || j.isNumber {
            hasDigital = true
        }
        
        if "!@#$%^&*()-+".contains(i) || "!@#$%^&*()-+".contains(j) {
            hasSpecial = true
        }
    }
    
    return hasUp && hasLower && hasDigital && hasSpecial
}
