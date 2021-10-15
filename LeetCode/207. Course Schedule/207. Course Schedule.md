# 207. Course Schedule



## 풀이

---

 위상정렬을 활용해서 해결할 수 있는 문제.

 각각의 강의마다 선수 강의의 수를 저장하는 indegree 배열과 해당 강의를 듣고 나서 들을수 있는 후속 강의들을 저장하는 graph 배열을 만들어준다. 예제와 같이 [[1, 0]]과 같이 주어질 경우 각각의 배열에는 다음과 같이 저장된다.

 <graph 배열>          

[0] : [1]    → 0번 강의를 들어야 1번 강의를 들을 수 있다.

[1] : []      → 1번 강의를 선수 강의로 하는 다른 강의가 존재하지 않는다.

<indegree 배열>

[0] : 0  → 0번 강의를 듣기 위한 선수 강의의 수는 0개이다.

[1] : 1   → 1번 강의를 듣기 위한 선수 강의의 수는 1개이다.

 이제 queue를 하나 만들어서 indegree가 0인(선수 강의가 필요없는) 강의의 목록들을 먼저 담아준다. 

```swift
for i in 0..<numCourses {
            if indegree[i] == 0 {
                q.append(i)
            }
        }
```

 그 후 큐를 돌면서 해당 강의의 다음 강의들에 대해서 indegree를 1씩 줄여준다. 이는 다음 강의를 수강하기 위해 필요한 선수 강의 하나를 수강했음을 의미한다. 1씩 줄여줬을 때 다음 강의의 indegree가 0이 되었다면 이제 수강할 수 있게 됐음을 의미하므로 큐에 새로 넣어준다.

 이 과정을 거쳤을 때 indegree 배열에 0이 아닌 값이 남아있다면 이는 모든 강의를 다 수강할 수 없음을 의미하므로 false를 리턴하고 그렇지 않을 경우 true를 리턴한다.

## 코드

---

- swift
  
    ```swift
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
    ```
    
- python
  
    ```python
    from collections import deque
    
    class Solution:
        def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
            graph = [[] for _ in range(numCourses)] # 강의 수강 후 들을 수 있는 강의의 리스트
            indegree = [0 for _ in range(numCourses)] # 강의의 선수 강의의 수를 담기 위한 리스트
    
            # 강의 리스트와 선수 강의의 수 초기화
            for (next, prev) in prerequisites:
                graph[prev].append(next)
                indegree[next] += 1
            
            q = deque()
    
            # 선수 강의의 수가 0인 강의들을 큐에 담아준다.
            for i in range(numCourses):
                if indegree[i] == 0:
                    q.append(i)
            
            # 큐를 돌면서 now 강의를 들었을 때 들을 수 있는 next 강의들의 선수 강의 수를 줄여준다.
            # next 강의의 선수 강의 수가 0이 되면 이제 next 강의를 들을 수 있는 것이므로 큐에 새롭게 넣어준다.
            while q:
                now = q.popleft()
    
                for next in graph[now]:
                    indegree[next] -= 1
    
                    if indegree[next] == 0:
                        q.append(next)
    
            # 위의 과정을 마쳤을 때 아직 선수 강의가 남아있는 강의가 있을 경우에는
            # False를 리턴한다.
            for course in indegree:
                if course != 0:
                    return False
            
            return True
    ```