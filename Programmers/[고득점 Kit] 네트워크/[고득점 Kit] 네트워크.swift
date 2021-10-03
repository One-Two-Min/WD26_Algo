import Foundation

var visited: [Bool] = [] // 네트워크 확인 여부 배열
var coms: [[Int]] = [[]]
var N: Int = 0
var res: Int = 0

func dfs(idx: Int) {
    for i in 0..<N {
        if visited[i] || i == idx {
            continue
        }
        
        // 연결되어 있으면 다시 한 번 dfs를 호출해서 체크해준다.
        if coms[idx][i] == 1{
            visited[i] = true
            dfs(idx: i)
        }
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    visited = [Bool](repeating: false, count: n)
    coms = computers
    N = n
    
    // 각 컴퓨터를 돌면서 이미 네트워크 확인한 컴퓨터(visited[컴퓨터]가 true인 경우)일 때는 dfs를 안타도록 continue 해줌
    for i in 0..<n {
        if visited[i] {
            continue
        }
        
        // dfs가 호출되면 네트워크 개수를 1 증가시켜주고 네트워크 확인에 체크
        res += 1
        visited[i] = true
        dfs(idx: i)
    }
    
    return res
}
