# [고득점 Kit] 타겟 넘버



## 풀이

DFS를 활용해서 해결하는 문제

입력 받은 numbers 배열의 처음부터 끝까지 돌면서 한 번은 더하고 한 번은 빼준다. 끝까지 다 계산한 값과 타겟 넘버를 비교해서 둘의 값이 같으면 경우의 수를 1 증가시킨다.

마지막에 경우의 수를 return한다.

dfs(idx:len:sum:) 

- idx : numbers 배열에서 이번에 계산해야 할 인덱스 번호
- len: numbers 배열의 길이
- sum: numbers 배열을 처음부터 돌면서 현재까지 계산된 값

## 코드

```swift
import Foundation

var res: Int = 0 // target과 일치하는 경우의 수
var nums: [Int] = [] // 입력 받은 numbers 배열
var target_num: Int = 0 // 입력 받은 target 값

func dfs(idx: Int, len: Int, sum: Int){
    // 전체 배열을 돌았을 때 target 값과 sum이 같으면 경우의 수 1 증가
    if idx == len {
        if sum == target_num {
            res += 1
        }
        return
    }
    
    // 한 번은 더해주고 한 번은 빼주고
    dfs(idx: idx+1, len: len, sum: sum + nums[idx])
    dfs(idx: idx+1, len: len, sum: sum - nums[idx])
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    for number in numbers {
        nums.append(number)
    }
    target_num = target
    
    dfs(idx: 0, len: numbers.count, sum: 0)
    
    return res
}
```