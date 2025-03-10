//
//  BaseballGame.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

class BaseballGame {
    private let recordManager = RecordManager()
    private var round: Int = 0
    
    func start() {
        showMenu()
    }
    
    private func showMenu() {
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
    
    private func startGame() {
        let gameSession = GameSession()
        guard let tryCount = gameSession.startGame() else {
            print("오류: 게임 세션에서 시도 횟수를 가져오지 못했습니다.")
            return
        }
        round += 1
        recordManager.addGameRecord(GameRecord(round: round, tryCount: tryCount))
    }
}
