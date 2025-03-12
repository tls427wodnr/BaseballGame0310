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
                //let inputNumbers = Array(input).compactMap { $0.wholeNumberValue }
                let inputNumbers = input.compactMap { $0.wholeNumberValue }
                // 1. String은 Sequence 프로토콜을 따르므로, compactMap을 직접 적용할 수 있음.
                //    즉, String을 문자(Char) 배열로 변환할 필요 없음.
                // 2. compactMap이 입력받은 문자열의 각 문자(Character)를 순회하며 처리
                // 3. wholeNumberValue를 적용하여 숫자는 변환하고, 숫자가 아니면 nil 반환
                // 4. compactMap이 nil을 제거하여 최종적으로 정수 배열을 만듦
                // 예) "123a" -> ["1","2","3","a"] -> ["1","2","3",nil] -> [1,2,3]
                
                // inputNumbers가 중복되지 않은 3개의 값인지 Set으로 변환하여 검증
                // Set은 중복되는 값은 제거하는 기능이 있기에 만약 1233 같은 경우 통과를 하게 됨
                // 그걸 방지하기 위해 inputNumbers.count == 3을 추가로 검사하여 입력 값 자체가 3개인지도 확인
                // 추가로 input이 123abc 같은 경우 inputNumbers가 123으로 통과되기에 이를 통과 못하게 조건문을 달아줘야함
                if inputNumbers.count == input.count, inputNumbers.count == 3, Set(inputNumbers).count == 3 {
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
