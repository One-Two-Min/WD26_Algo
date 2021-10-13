class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result: Int = 0 // 섬의 갯수
        let dx: [Int] = [1, -1, 0, 0]
        let dy: [Int] = [0, 0, 1, -1]
        
        // 방문 체크 배열
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        // 해당 [x][y]와 연결 되어 있는 land를 체크하는 dfs 함수
        // 상하좌우 4번을 탐색한다.
        func dfs(_ x: Int, _ y: Int) {
            for i in 0..<4 {
                let nx: Int = x + dx[i]
                let ny: Int = y + dy[i]
                
                // 맵의 바깥 범위의 경우 건너뛴다.
                if nx < 0 || ny < 0 || nx >= grid.count || ny >= grid[0].count {
                    continue
                }
                
                // 맵이 땅이 아니거나 이미 방문한 곳이라면 건너뛴다.
                if grid[nx][ny] == "0" || visited[nx][ny] {
                    continue
                }
                
                // 방문 체크를 해주고 [nx][ny]로 넘어가서 다시 dfs 체크한다.
                visited[nx][ny] = true
                dfs(nx, ny)
            }
        }
        
        // 맵이 land이고 아직 방문하지 않은 곳이면 dfs 함수를 호출한다.
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" && !visited[i][j] {
                    result += 1
                    visited[i][j] = true
                    dfs(i, j)
                }
            }
        }
        
        return result
    }
}
