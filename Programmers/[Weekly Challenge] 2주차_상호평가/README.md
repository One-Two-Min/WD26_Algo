# [Weekly Challenge] 2주차_상호평가



## 풀이

 먼저 각 학생 별로 얻은 총 점수의 배열을 만든다.

 그 후 배열을 돌면서 각 학생 별로 최고 점수, 최저 점수, 점수의 총합을 구한다. 최고 점수나 최저 점수가 자기 자신한테 준 점수와 같을 경우 해당 점수를 제외하는 과정을 거쳐서 등급을 산출하면 된다.

## 코드

- Python
  
    ```python
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
    ```
    
- Swift
  
    ```swift
    import Foundation
    
    // 점수에 따른 학점 부여 함수
    func gradeCheck(_ score: Double) -> String {
        switch score {
        case 90...:
            return "A"
        case 80..<90:
            return "B"
        case 70..<80:
            return "C"
        case 50..<70:
            return "D"
        default:
            return "F"
        }
    }
    
    func solution(_ scores:[[Int]]) -> String {
        var result: String = ""
        let n: Int = scores.count
        
        // 기존에 n번 학생이 부여한 점수 리스트에서
        // n번 학생이 받은 점수를 뽑아서 리스트로 만들어준다.
        var student_scores: [[Int]] = Array(repeating: [], count: n)
        
        for j in 0..<n {
            for i in 0..<n {
                student_scores[j].append(scores[i][j])
            }
        }
        
        var index: Int = 0
        
        // 0번 학생부터 받은 점수의 최대 점수, 최소 점수를 뽑는다.
        for score in student_scores {
            let max_score: Int? = score.max()
            let min_score: Int? = score.min()
            var score_sum: Int = score.reduce(0) { $0 + $1 }
            var N: Int = n // 전체 학생 수
            
            
            // 최대 점수가 자기가 준 점수이고 유일한 점수일 경우(cnt = 1)
            // 평균에서 자신이 준 점수를 제외한다. (1), (2)
            if let max_score = max_score, max_score == scores[index][index] {
                let count: Int = score.filter { $0 == max_score }.count
                
                if count == 1 {
                    score_sum -= max_score // (1)
                    N -= 1                 // (2)
                }
            }
            
            // 최소 점수가 자기가 준 점수이고 유일한 점수일 경우(cnt = 1)
            // 평균에서 자신이 준 점수를 제외한다. (1), (2)
            if let min_score = min_score, min_score == scores[index][index] {
                let count: Int = score.filter { $0 == min_score }.count
                
                if count == 1 {
                    score_sum -= min_score // (1)
                    N -= 1                 // (2)
                }
            }
            
            index += 1
            if N == 0 {
                result += "F"
                continue
            }
            result += gradeCheck(Double(score_sum) / Double(N))
        }
        
        return result
    }
    ```