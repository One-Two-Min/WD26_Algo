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
