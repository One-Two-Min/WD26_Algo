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
