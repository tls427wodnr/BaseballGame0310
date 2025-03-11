//
//  RecordManager.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

// GameRecord 모델
struct GameRecord {
    let round: Int // 라운드 횟수
    let tryCount: Int // 라운드당 시도 횟수
}

class RecordManager {
    private var gameRecords: [GameRecord] = []
    
    func addGameRecord(_ record: GameRecord) {
        gameRecords.append(record)
    }
    
    func showGameRecords() {
        print("< 게임 기록 보기 >")
        for record in gameRecords {
            print("\(record.round)번째 게임 : 시도 횟수 - \(record.tryCount)")
        }
    }
}
