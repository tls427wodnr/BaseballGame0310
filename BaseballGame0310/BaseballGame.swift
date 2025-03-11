//
//  BaseballGame.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

class BaseballGame {
    private let recordManager = RecordManager() // 게임 기록을 관리하는 객체
    private var round: Int = 0 // 라운드를 기록하는 변수
    
    // 게임 진입 함수
    func start() {
        showMenu()
    }
    
    // 메뉴 출력 함수
    private func showMenu() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            // 입력값이 nil이 아니고, 정수여야 if문 안으로 진입한다.
            if let input = readLine(), let choice = Int(input) {
                switch choice {
                case 1:
                    startGame() // 게임 시작 하기
                case 2:
                    recordManager.showGameRecords() // 게임 기록 보기
                case 3:
                    print("게임을 종료합니다.")
                    return // 게임 종료 하기
                default:
                    print("올바른 번호를 입력해주세요.") // 예외처리(1~3 이외에 정수인 경우)
                }
            } else {
                print("숫자를 입력해주세요.") // 예외처리(입력값이 공백이거나 정수가 아닌 경우)
            }
        }
    }
    
    // 게임 시작 함수
    private func startGame() {
        let gameSession = GameSession()
        
        // 게임을 시작하고, 게임 끝날시 시도 횟수를 받아옴
        guard let tryCount = gameSession.startGame() else {
            print("오류: 게임 세션에서 시도 횟수를 가져오지 못했습니다.")
            return
        }
        
        // 게임 라운드 증가
        round += 1
        
        // 게임 기록 저장
        recordManager.addGameRecord(GameRecord(round: round, tryCount: tryCount))
    }
}
