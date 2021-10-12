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
