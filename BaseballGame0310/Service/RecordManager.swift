//
//  RecordManager.swift
//  BaseballGame0310
//
//  Created by tlswo on 3/10/25.
//

struct GameRecord {
    let round: Int
    let tryCount: Int
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
