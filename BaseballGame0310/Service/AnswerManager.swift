//
//  AnswerManager.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

struct Answer {
    let numbers: [Int]
}

class AnswerManager {
    func generateAnswer() -> Answer {
        var numberSet = Set<Int>()
        numberSet.insert(Int.random(in: 1...9))

        while numberSet.count < 3 {
            numberSet.insert(Int.random(in: 0...9))
        }

        return Answer(numbers: Array(numberSet))
    }
    
    func checkResult(_ inputNumbers: [Int], answer: Answer) -> Bool {
        var strikeCount = 0
        var ballCount = 0
        
        for i in 0..<3 {
            if inputNumbers[i] == answer.numbers[i] {
                strikeCount += 1
            } else if answer.numbers.contains(inputNumbers[i]) {
                ballCount += 1
            }
        }
        
        if strikeCount == 3 {
            print("정답입니다!")
            return true
        } else if strikeCount > 0 || ballCount > 0 {
            print("\(strikeCount) 스트라이크, \(ballCount) 볼")
            return false
        } else {
            print("Nothing")
            return false
        }
    }
}
