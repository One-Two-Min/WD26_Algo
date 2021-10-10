# [Weekly Challenge] 5주차_모음사전



## 풀이

 words 배열에 모음의 순서대로 담아둔다. 그리고 재귀를 돌면서 입력받은 단어가 몇 번째에 있는지를 탐색한다. 

 재귀를 도는 과정은 다음 처럼 진행된다.

"A" → "AA" → "AAA" → "AAAA" → "AAAAA"

그 후 현재 단어의 길이가 5가 됐으므로 중간에 탐색이 종료된다. 그럼 이제 "AAAA"에 모음의 두 번째 단어인 "E"가 붙어 "AAAAE"가 된다. 함수가 한 번 호출될때마다 cnt 변수가 1씩 증가하고 이렇게 탐색하며 입력받은 단어에 도달하면 res 변수에 cnt를 담아주고 탐색을 종료한다.

## 코드

- Python
  
    ```python
    words = ['A', 'E', 'I', 'O', 'U']
    flag = False
    res = 0 # 입력으로 주어진 word의 순서
    cnt = 0 # 재귀를 돌면서 하나씩 늘려가는 변수
    
    def wordDict(now, word):
        global res, cnt
    
        # 현재 단어와 입력으로 주어진 단어가 일치할 경우
        # res에 cnt를 담아준다.
        if now == word:
            global flag
            flag = True
            res = cnt
            return
        
        # 입력으로 주어진 단어에 도달 or 현재 단어(now)의 길이가 5이면 재귀를 멈춘다.
        if flag or res != 0 or len(now) == 5:
            return
    
        # 현재 단어의 뒤에 A, E, I, O, U를 순서대로 붙여서 탐색해나간다.
        for i in range(5):
            cnt += 1
            wordDict(now + words[i], word)
    
    def solution(word):
        wordDict('', word)
        return res
    ```
    
- Swift
  
    ```swift
    import Foundation
    
    let words: [String] = ["A", "E", "I", "O", "U"]
    var flag: Bool = false
    var res: Int = 0 // 입력으로 주어진 word의 순서
    var cnt: Int = 0 // 재귀를 돌면서 하나씩 늘려가는 변수
    
    func wordDict(_ now: String, word: String) {
        // 현재 단어와 입력으로 주어진 단어가 일치할 경우
        // res에 cnt를 담아준다.
        if now == word {
            flag = true
            res = cnt
            return
        }
        
        // 입력으로 주어진 단어에 도달 or 현재 단어(now)의 길이가 5이면 재귀를 멈춘다.
        if flag || res != 0 || now.count == 5 {
            return
        }
        
        // 현재 단어의 뒤에 A, E, I, O, U를 순서대로 붙여서 탐색해나간다.
        for i in 0..<5 {
            cnt += 1
            wordDict(now + words[i], word: word)
        }
    }
    
    func solution(_ word:String) -> Int {
        wordDict("", word: word)
        return res
    }
    ```