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
