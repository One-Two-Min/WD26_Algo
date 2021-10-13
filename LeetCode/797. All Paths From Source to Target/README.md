# 797. All Paths From Source to Target

## 풀이

---

 0번 부터 시작하여 n-1번까지 가는 경로를 모두 찾으면 되는 문제다. 입력 받은 graph에서 0번 꼭짓점과 연결된 꼭짓점부터 dfs를 탐색하도록 했다.

```swift
// 0번 부터 탐색 시작
        for vertex in graph[0] {
            dfs(vertex, [0, vertex], graph)
        }
```

 

 비슷한 방식으로 dfs 함수 내에서 vertex와 연결된 꼭짓점으로 탐색을 이어나간다. 그렇게 마지막에 n-1번 꼭짓점을 만났을 때 지금까지 기록한 경로를 결과 배열에 append해주고 탐색을 종료한다.

## 코드

---

```swift
class Solution {

    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let n: Int = graph.count - 1
        var res: [[Int]] = []
        
        // (now: 현재 꼭짓점 번호, path: 현재 까지 거쳐온 경로, graph: 입력 받은 그래프)
        // *graph를 입력으로 안받았을 때 오히려 실행 시간 증가
        // 현재 꼭짓점의 간선을 돌면서 dfs로 탐색
        // 마지막 꼭짓점에 도달하면 현재까지의 경로를 결과에 append
        func dfs(_ now: Int, _ path: [Int], _ graph: [[Int]]) {
            if now == n {
                res.append(path)
            }
            
            for vertex in graph[now] {
                dfs(vertex, path + [vertex], graph)
            }
        }
        
        // 0번 부터 탐색 시작
        for vertex in graph[0] {
            dfs(vertex, [0, vertex], graph)
        }
        
        return res
    }
}
```