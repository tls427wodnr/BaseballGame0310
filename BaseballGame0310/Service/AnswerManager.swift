//
//  AnswerManager.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

// Answer 모델
struct Answer {
    let numbers: [Int]
}

class AnswerManager {
    func generateAnswer() -> Answer {
        var numberSet = Set<Int>() // 중복 값을 막기 위해 Set으로 설정
        numberSet.insert(Int.random(in: 1...9)) // 정답의 첫값이 0이 안나오게 하기 위해서

        while numberSet.count < 3 {
            numberSet.insert(Int.random(in: 0...9)) // 나머지 2개 값 생성
        }

        return Answer(numbers: Array(numberSet)) // 배열로 변환하여 Answer 객체 생성
    }
    
    func checkResult(_ inputNumbers: [Int], answer: Answer) -> Bool {
        var strikeCount = 0
        var ballCount = 0
        
        for i in 0..<3 {
            if inputNumbers[i] == answer.numbers[i] { // 일치하는 경우
                strikeCount += 1
            } else if answer.numbers.contains(inputNumbers[i]) { // 일치하지는 않지만 인풋 값이 numbers 배열에 존재하는 경우
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
