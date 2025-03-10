//
//  BaseballGame.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

class BaseballGame {
    private let answerManager = AnswerManager()
    private let recordManager = RecordManager()
    private var answer: Answer?
    private var round: Int = 0
    
    func showMenu() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            if let input = readLine() {
                let choice = Int(input)
                switch choice {
                case 1:
                    startGame()
                case 2:
                    recordManager.showGameRecords()
                case 3:
                    print("게임을 종료합니다.")
                    return
                default:
                    print("올바른 번호를 입력해주세요.")
                }
            } else {
                print("숫자를 입력해주세요.")
            }
        }
    }
    
    func startGame() {
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
                        return
                    }
                    isCorrect = answerManager.checkResult(inputNumbers, answer: answer)
                } else {
                    print("올바르지 않은 입력값입니다")
                }
            }
        }
        round += 1
        recordManager.addGameRecord(GameRecord(round: round, tryCount: tryCount))
    }
}
