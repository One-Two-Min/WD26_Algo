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
