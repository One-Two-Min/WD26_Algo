class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var res: [Int] = []
        var alphabet: [Int] = [Int](repeating: 0, count: 26) // 각 문자별 마지막 인덱스 번호를 담는 배열
        var visited: [Bool] = [Bool](repeating: false, count: 26) // 각 문자가 사용됐는지를 체크하는 배열
        var idx: Int = 0
        var ascii_idx: Int = 0
        var start_idx: Int = 0
        var end_idx: Int = 0
        
        // 먼저 문자열을 돌면서 alphabet에 각 문자별 마지막 index를 넣어준다.
        for c in s {
            alphabet[Int(c.asciiValue!) - 97] = idx
            idx += 1
        }
        
        // 다시 for문을 돌면서 체크
        idx = 0
        for c in s {
            ascii_idx = Int(c.asciiValue!) - 97 // 먼저 현재 문자의 인덱스 추출
            
            // 아직 사용되지 않은 문자라면
            // 마지막 인덱스 번호를 제일 큰 값으로 갱신한다.
            if !visited[ascii_idx] {
                visited[ascii_idx] = true
                end_idx = max(end_idx, alphabet[ascii_idx])
            }
            
            // idx가 위에서 갱신한 end_idx와 같아졌다면
            // 길이를 계산하여 결과 배열에 넣어준다.
            if idx == end_idx {
                res.append(end_idx - start_idx + 1)
                start_idx = end_idx + 1
                end_idx = 0
            }
            
            idx += 1
        }
        
        return res
        
    }
}

var t = Solution()
print(t.partitionLabels("eccbbbbdec"))
//Solution.partitionLabels("ababcbacadefegdehijhklij")
