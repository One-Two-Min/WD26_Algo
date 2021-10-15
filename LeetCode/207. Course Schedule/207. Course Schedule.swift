class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph: [[Int]] = Array(repeating: [], count: numCourses) // 강의 수강 후 들을 수 있는 강의의 리스트
        var indegree: [Int] = Array(repeating: 0, count: numCourses) // 강의의 선수 강의의 수를 담기 위한 리스트
        
        // 강의 리스트와 선수 강의의 수 초기화
        for prerequisite in prerequisites {
            let next: Int = prerequisite[0]
            let prev: Int = prerequisite[1]
            
            graph[prev].append(next)
            indegree[next] += 1
        }
        
        var q: [Int] = []
        
        // 선수 강의의 수가 0인 강의들을 큐에 담아준다.
        for i in 0..<numCourses {
            if indegree[i] == 0 {
                q.append(i)
            }
        }
        
        // 큐를 돌면서 now 강의를 들었을 때 들을 수 있는 next 강의들의 선수 강의 수를 줄여준다.
        // next 강의의 선수 강의 수가 0이 되면 이제 next 강의를 들을 수 있는 것이므로 큐에 새롭게 넣어준다.
        while !q.isEmpty {
            let now: Int = q.removeFirst()
            
            for next in graph[now] {
                indegree[next] -= 1
                
                if indegree[next] == 0 {
                    q.append(next)
                }
            }
        }
        
        // 위의 과정을 마쳤을 때 아직 선수 강의가 남아있는 강의가 있을 경우에는
        // False를 리턴한다.
        for course in indegree {
            if course != 0 {
                return false
            }
        }
        
        return true
    }
}
