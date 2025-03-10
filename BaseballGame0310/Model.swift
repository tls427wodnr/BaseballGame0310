//
//  Model.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

import Foundation

struct Answer {
    var numbers: [Int]
    
    init() {
        var numberSet = Set<Int>()
        numberSet.insert(Int.random(in: 1...9))
        while numberSet.count < 3 {
            numberSet.insert(Int.random(in: 0...9))
        }
        self.numbers = Array(numberSet)
    }
}

struct GameRecord {
    let round: Int
    let tryCount: Int
}
