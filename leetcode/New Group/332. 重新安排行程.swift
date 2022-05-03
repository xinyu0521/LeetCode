//
//  332. 重新安排行程.swift
//  leetcode
//
//  Created by zhanx630 on 2022/4/20.
//

import Foundation

func findItinerary(_ tickets: [[String]]) -> [String] {
    var map: [String: [String]] = [:]
    
    for ticket in tickets {
        if map[ticket[0]] == nil {
            map[ticket[0]] = [ticket[1]]
        } else {
            map[ticket[0]]?.append(ticket[1])
        }
    }
    
    for key in map.keys {
        map[key]?.sort()
    }
    
    var res: [String] = []
    
    func visit(_ vertex: String) {
        if map[vertex] == nil {
            res.append(vertex)
            return
        }
        
        while !map[vertex]!.isEmpty {
            visit(map[vertex]!.removeFirst())
        }
    
        res.append(vertex)
    }
    
    visit("JFK")
    
    return res.reversed()
}
