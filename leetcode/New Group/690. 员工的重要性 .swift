//
//  690. 员工的重要性 .swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/23.
//

import Foundation

public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}

func getImportance(_ employees: [Employee], _ id: Int) -> Int {
    var map: [Int: Employee] = [:]
        
    for employee in employees {
        map[employee.id] = employee
    }
    
    var res = 0
    
    func dfs(_ id: Int) {
        guard let emp = map[id] else {
            return
        }
        res += emp.importance
        
        for e in emp.subordinates {
            dfs(map[e]!.id)
        }
    }
    
    dfs(id)
    return res
}
