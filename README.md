# 내일배움캠프 프로그래밍 기초 주차 과제 - Swift로 야구 게임 만들기

### 프로젝트 소개
숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다. 
각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다.
예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 
이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.

### 프로젝트 파일 구조
- main.swift // 메인 실행 파일
- BaseballGame.swift // 게임 관련 로직
- Model.swift // 데이터 모델(Answer, GameRecord)

### 프로그램 진행 흐름

#### 시작 메뉴 
1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
이렇게 3가지 메뉴가 나옵니다. 

#### 게임 시작 
1번을 누르면 게임을 시작합니다. 
중복되지 않은 숫자 3개를 입력합니다.
숫자와 자리가 모두 일치시 스트라이크, 숫자만 일치시 볼 입니다. 
이 내용을 힌트로 정답을 찾습니다.
정답을 맞출경우 다시 시작 메뉴로 돌아갑니다. 

#### 게임 기록 보기
2번을 누르면 이제까지 진행한 게임 기록을 볼수있습니다.
내가 진행한 라운드와 그 라운드에서 시도 횟수를 볼수 있습니다.

#### 종료 
3번을 누르면 게임을 종료합니다.
