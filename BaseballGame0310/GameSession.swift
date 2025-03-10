//
//  GameSession.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/11/25.
//

class GameSession {
    private let answerManager = AnswerManager()
    private var answer: Answer?

    func startGame() -> Int? {
        var tryCount: Int = 0
        var isCorrect: Bool = false
        answer = answerManager.generateAnswer()
        print("< 게임을 시작합니다 >")
        while(!isCorrect) {
            tryCount += 1
            print("숫자를 입력하세요")
            if let input = readLine(){
                let inputNumbers = Array(input).compactMap { Int(String($0)) }
                
                if inputNumbers.count == 3, Set(inputNumbers).count == 3 {
                    guard let answer = answer else {
                        print("오류: 정답이 설정되지 않았습니다.")
                        return nil
                    }
                    isCorrect = answerManager.checkResult(inputNumbers, answer: answer)
                } else {
                    print("올바르지 않은 입력값입니다")
                }
            }
        }
        return tryCount
    }
}
