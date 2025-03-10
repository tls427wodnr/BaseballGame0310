//
//  BaseballGame.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

import Foundation

class BaseballGame {
    var answer: Answer?
    var round: Int = 0
    var gameRecords: [GameRecord] = []
    
    func showMenu() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")

        if let input = readLine() {
            let choice = Int(input)
            switch choice {
            case 1:
                startGame()
            case 2:
                showGameRecords()
            case 3:
                print("게임을 종료합니다.")
                return
            default:
                print("올바른 번호를 입력해주세요.")
                showMenu()
            }
        } else {
            print("숫자를 입력해주세요.")
            showMenu()
        }
    }
    
    func showGameRecords() {
        print("< 게임 기록 보기 >")
        for record in gameRecords {
            print("\(record.round)번째 게임 : 시도 횟수 - \(record.tryCount)")
        }
        showMenu()
    }
    
    func startGame() {
        var tryCount: Int = 0
        var isCorrect: Bool = false
        answer = Answer()
        print("< 게임을 시작합니다 >")
        while(!isCorrect) {
            tryCount += 1
            print("숫자를 입력하세요")
            if let input = readLine(){
                let inputNumbers = Array(input).compactMap { Int(String($0)) }
                
                if inputNumbers.count == 3, Set(inputNumbers).count == 3 {
                    isCorrect = checkResult(inputNumbers)
                } else {
                    print("올바르지 않은 입력값입니다")
                }
            }
        }
        round += 1
        gameRecords.append(GameRecord(round: round, tryCount: tryCount))
        showMenu()
    }
    
    func checkResult(_ inputNumbers: [Int]) -> Bool {
        guard let answer = answer else {
            print("오류: 정답이 설정되지 않았습니다.")
            return false
        }
        
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
