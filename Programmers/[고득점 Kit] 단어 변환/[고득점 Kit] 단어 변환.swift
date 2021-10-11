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

