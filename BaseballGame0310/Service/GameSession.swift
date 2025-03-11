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
        answer = answerManager.generateAnswer() // 정답 생성
        print("< 게임을 시작합니다 >")
        while(!isCorrect) { // 정답을 맞출때까지 반복
            tryCount += 1
            print("숫자를 입력하세요")
            if let input = readLine(){
                // let inputNumbers = Array(input).compactMap { Int(String($0)) }
                let inputNumbers = Array(input).compactMap { $0.wholeNumberValue }
                // 1. 입력받은 문자열을 문자(Character) 배열로 변환 (예: "123a" -> ["1","2","3","a"])
                // 2. wholeNumberValue를 이용하여 문자 배열을 정수형 배열로 변환 (예: ["1","2","3","a"] -> [1,2,3,nil])
                // 3. 이때 wholeNumberValue는 숫자가 아닌 값은 nil로 반환 하는데 이 값들을 compactMap으로 자동 제거 (예: [1,2,3,nil] -> [1,2,3])
                // 4. 최종적으로 숫자만 있는 정수 배열을 생성 (예: [1,2,3])
                
                // inputNumbers가 중복되지 않은 3개의 값인지 Set으로 변환하여 검증
                // Set은 중복되는 값은 제거하는 기능이 있기에 만약 1233 같은 경우 통과를 하게 됨
                // 그걸 방지하기 위해 inputNumbers.count == 3을 추가로 검사하여 입력 값 자체가 3개인지도 확인
                if inputNumbers.count == 3, Set(inputNumbers).count == 3 {
                    guard let answer = answer else {
                        print("오류: 정답이 설정되지 않았습니다.")
                        return nil
                    }
                    isCorrect = answerManager.checkResult(inputNumbers, answer: answer)
                    // 정답이면 isCorrect가 true가 되서 반복문 중단
                } else {
                    print("올바르지 않은 입력값입니다") 
                }
            }
        }
        return tryCount
    }
}
