# [고득점 Kit] 소수 찾기

link: https://programmers.co.kr/learn/courses/30/lessons/42839
태그: 완전탐색
파일: https://www.notion.so/51891f553f57409cacf00ab052c0bed8

# 풀이

---

먼저 입력 받은 numbers 문자열을 Int형 배열로 만들어준다.

```swift
let intArray: [Int] = numbers.map { Int(String($0)) ?? 0 }
```

순열을 이용해서 만들어 낼 수 있는 모든 숫자 조합을 찾은 후에 각각의 숫자를 소수인지 판별하여 셋에 저장한 후에 마지막에 셋에 있는 숫자의 개수를 카운트한다.