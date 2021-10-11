# [고득점 Kit] 단어 변환



## 풀이

---

 문제에서 가장 짧은 변환 과정이라고 했으므로 최단 거리를 찾기 위해 bfs를 활용했다. 

 큐에는 총 3가지 정보를 넣어줬다. (현재 단어, 변환 횟수, 현재 단어의 인덱스)이다. 초기에는 인덱스에 -1을 넣어줬다. 인덱스의 경우는 checked 배열에서 사용하기 위해 넣어줬다. 주어진 words의 for문을 돌면서 현재 단어에서 다음 단어로 변환을 한 적이 있는지를 체크한다.

 큐를 돌면서 target 단어를 만나면 변환 횟수를 리턴하고 종료한다.

## 코드

---

- Python
  
    ```python
    from queue import Queue
    
    # 현재 단어(word)와 다음 단어(target)가 한 글자 차이인지를 체크하기 위한 메서드
    def checkWord(word, target):
        cnt = 0
        for i in range(len(word)):
            if word[i] != target[i]:
                cnt += 1
            
            if cnt > 1:
                return False
        return True
    
        
    def solution(begin, target, words):
        q = Queue()
        q.put((begin, 0, -1))
    
        # [현재 단어][다음 단어]
        # 큐에서 현재 단어를 꺼내서 for문을 돌면서 다음 단어의 방문 체크
        checked = [[False for _ in range(len(words))] for _ in range(len(words))]
    
        # words에 target 단어가 없으면 0 리턴
        if target not in words:
            return 0
        
        while q:
            word, cnt, idx = q.get()
    
            if word == target:
                return cnt
    
            for i in range(len(words)):
                if idx != -1 and checked[idx][i]:
                    continue
                
                if checkWord(word, words[i]):
                    q.put((words[i], cnt+1, i))
    
                    if idx != -1:
                        checked[idx][i] = True
    ```
    
- Swift
  
    ```swift
    import Foundation
    
    typealias qElement = (word: String, cnt: Int, idx: Int)
    
    // 현재 단어(word)와 다음 단어(target)가 한 글자 차이인지를 체크하기 위한 메서드
    func checkWord(_ word: String, _ target: String) -> Bool {
        var cnt: Int = 0
        
        for i in 0..<word.count {
            let word_idx = word.index(word.startIndex, offsetBy: i)
            let target_idx = target.index(target.startIndex, offsetBy: i)
            
            if word[word_idx] != target[target_idx] {
                cnt += 1
            }
            
            if cnt > 1 {
                return false
            }
        }
        
        return true
    }
    
    func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
        
        // [현재 단어][다음 단어]
        // 큐에서 현재 단어를 꺼내서 for문을 돌면서 다음 단어의 방문 체크
        var checked: [[Bool]] = Array(repeating: Array(repeating: false, count: words.count), count: words.count)
        var q: [qElement] = [(begin, 0, -1)]
        
        while !q.isEmpty {
            let now: qElement = q.removeFirst()
            
            if now.word == target {
                return now.cnt
            }
            
            for i in 0..<words.count {
                if now.idx != -1 && checked[now.idx][i] {
                    continue
                }
                    
                if checkWord(now.word, words[i]) {
                    q.append((words[i], now.cnt + 1, i))
                    
                    if now.idx != -1 {
                        checked[now.idx][i] = true
                    }
                }
            }
        }
        
        return 0
    }
    ```