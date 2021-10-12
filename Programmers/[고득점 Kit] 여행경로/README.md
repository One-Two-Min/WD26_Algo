# [고득점 Kit] 여행경로



## 풀이

---

 dfs를 이용해서 문제를 해결했다.

 먼저 "ICN"부터 시작해서 전체 티켓을 체크한다. 티켓을 체크해가며 여행 경로를 담아두고 전체 티켓을 다 사용했을 때 현재 찾은 경로와 이전에 찾은 경로를 비교 하여 현재 찾은 경로가 알파벳 순서가 앞설 경우 찾은 경로를 변경한다.

 python은 단순히 이전에 찾은 경로 배열과 현재 찾은 경로 배열을 연산자 비교를 통해서 어떤 경로가 알파벳 순서를 앞서는지 알 수 있지만 swift에서는 불가능하여 reduce를 사용하여 String 배열을 하나의 String으로 변경하여 알파벳 순서를 비교해줬다(ex. ["ICN", "SFO", "ATL"] -> "ICNSFOATL")

## 코드

---

- Python
  
    ```python
    visited = [] # 티켓별로 사용했는지를 체크하기 위한 리스트
    answer = []  # 경로를 담아두는 리스트
    ticket = []  # 입력으로 받은 티켓을 전역 리스트로
    
    # (사용한 티켓의 개수, 전체 티켓의 개수, dfs를 돌면서 담아둔 여행 경로, 출발 도시)
    def dfs(cnt, n, ans, city):
        
        # 전체 티켓을 다 사용했으면 현재 경로가 기존에 찾았던 경로보다 알파벳 순으로 앞서는지를 체크
        # 앞선다면 경로를 변경해준다.
        if cnt == n:
            global answer
    
            if not ans > answer or len(answer) == 0:
                answer = ans
            return
        
        for i in range(n):
            if visited[i] or ticket[i][0] != city:
                continue
            
            if ticket[i][0] == city:
                visited[i] = True
                dfs(cnt+1, n, ans+[ticket[i][1]], ticket[i][1])
                visited[i] = False
    
    def solution(tickets):    
        global visited, ticket
        visited = [False for _ in range(len(tickets))]
        ticket = tickets[:]
    
        dfs(0, len(tickets), ['ICN'], 'ICN')
        return answer
    ```
    
- Swift
  
    ```swift
    import Foundation
    
    var visited: [Bool] = [] // 티켓별로 사용했는지를 체크하기 위한 리스트
    var answer: [String] = [] // 경로를 담아두는 리스트
    
    // (사용한 티켓의 개수, 전체 티켓의 개수, dfs를 돌면서 담아둔 여행 경로, 입력 받은 티켓, 출발 도시)
    func dfs(_ cnt: Int, _ n: Int, _ ans: [String], _ tickets: [[String]], _ city: String) {
        
        // 전체 티켓을 다 사용했으면 현재 경로가 기존에 찾았던 경로보다 알파벳 순으로 앞서는지를 체크
        // 앞선다면 경로를 변경해준다.
        if cnt == n {
            if answer.count == 0 {
                answer = ans
                return
            }
            
            // 경로를 비교하기 위해 하나의 String으로 변경
            // ex) ["ICN", "SFO", "ATL"] -> "ICNSFOATL"
            let answer_string = answer.reduce("") { $0 + $1 }
            let ans_string = ans.reduce("") { $0 + $1 }
            
            if ans_string < answer_string {
                answer = ans
            }
            
            return
        }
        
        for i in 0..<tickets.count {
            if visited[i] || tickets[i][0] != city {
                continue
            }
            
            if tickets[i][0] == city {
                visited[i] = true
                dfs(cnt+1, n, ans + [tickets[i][1]], tickets, tickets[i][1])
                visited[i] = false
            }
        }
    }
    
    func solution(_ tickets:[[String]]) -> [String] {
        visited = Array(repeating: false, count: tickets.count)
        
        dfs(0, tickets.count, ["ICN"], tickets, "ICN")
        
        return answer
    }
    ```