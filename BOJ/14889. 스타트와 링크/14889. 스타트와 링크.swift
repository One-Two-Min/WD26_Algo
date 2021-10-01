var res: Int = Int.max - 1

// 모든 멤버에서 N/2만큼 조합을 뽑는다.
// 1을 포함한 조합만 뽑게 했는데 이유는 한 쪽에 1을 포함한 모든 가능한 조합을 뽑으면 반대쪽에 1을 제외한 모든 가능한 조합이 뽑히므로
// 1이 포함되지 않은 조합은 뽑을 이유가 없다.
func combi(_ nums: [Int], _ targetNum: Int) {
    func combination(_ idx: Int, _ combiRes: [Int]) {
        if combiRes.count == targetNum {
            var startTeam: Int = 0
            
            for i in 0..<combiRes.count-1 {
                for j in i+1..<combiRes.count {
                    startTeam += array[combiRes[i]-1][combiRes[j]-1] + array[combiRes[j]-1][combiRes[i]-1]
                }
            }
            
            // 전체 멤버에서 start 팀을 제외한 멤버를 link 팀에 배정한다.
            let linkTeamArray = Array(Set(member).symmetricDifference(Set(combiRes)))
            var linkTeam: Int = 0
            
            for i in 0..<linkTeamArray.count-1 {
                for j in i+1..<linkTeamArray.count {
                    linkTeam += array[linkTeamArray[i]-1][linkTeamArray[j]-1] + array[linkTeamArray[j]-1][linkTeamArray[i]-1]
                }
            }
            
            res = min(res, abs(startTeam - linkTeam))
            
            return
        }
        
        for i in idx..<nums.count {
            combination(i+1, combiRes + [nums[i]])
            
            // 조합을 뽑았을 때 1이 포함되어 있지 않은 경우를 가지치기한다.
            if !combiRes.contains(1){
                return
            }
        }
    }
    
    combination(0, [])
}

var N: Int = 0

if let input = readLine() {
    N = Int(input)!
}

var member: [Int] = Array(Range(1...N)) // 1부터 N까지 멤버의 번호
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N) // 능력치 배열

for i in 0..<N {
    if let input = readLine() {
        let inputs = input.split(separator: " ").map { Int($0)! }
        
        array[i] = inputs
    }
}


combi(member, N/2)
print(res)
