# 점수에 따른 학점 부여 함수
def gradeCheck(score):
    if score >= 90:
        return 'A'
    elif score >= 80:
        return 'B'
    elif score >= 70:
        return 'C'
    elif score >= 50:
        return 'D'
    else:
        return 'F'


def solution(scores):
    answer = ''
    n = len(scores) # 학생의 수

    # 기존에 n번 학생이 부여한 점수 리스트에서
    # n번 학생이 받은 점수를 뽑아서 리스트로 만들어준다.
    student_scores = [[] for _ in range(n)]

    for j in range(n):
        for i in range(n):
            score = scores[i][j]
            student_scores[j].append(score)

    student_num = 0

    # 0번 학생부터 받은 점수의 최대 점수, 최소 점수를 뽑는다.
    for score in student_scores:
        max_score = max(score)
        min_score = min(score)
        score_sum = sum(score)
        N = n # 전체 학생 수

        # 최대 점수가 자기가 준 점수이고 유일한 점수일 경우(cnt = 1)
        # 평균에서 자신이 준 점수를 제외한다. (1), (2)
        if max_score == scores[student_num][student_num]:
            cnt = score.count(max_score)
            if cnt == 1:
                score_sum -= max_score # (1)
                N -= 1                 # (2)

        # 최소 점수가 자기가 준 점수이고 유일한 점수일 경우(cnt = 1)
        # 평균에서 자신이 준 점수를 제외한다. (1), (2)
        if min_score == scores[student_num][student_num]:
            cnt = score.count(min_score)
            if cnt == 1:
                score_sum -= min_score # (1)
                N -= 1                 # (2)

        answer += gradeCheck(score_sum / N)
        student_num += 1

    return answer