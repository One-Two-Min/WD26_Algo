# 860. Lemonade Change

# 풀이

---

 dollars라는 배열을 만들어서 각각 순서대로 $5, $10, $20의 갯수를 카운팅했다.

 bills 배열을 돌면서 받은 금액을 1 증가시켜주고 거스름돈을 switch문을 이용해서 처리했다. 거스름돈의 경우는 다음과 같다.

- (1) $10을 받고 $5를 거슬러 주는 경우
    - $5를 1개 이용해서 거슬러 준다.
- (2) $20을 받고 $15를 거슬러 주는 경우
    - $10 1개, $5 1개를 이용해서 거슬러 준다.
    - $10이 없는 경우 $5 3개를 이용해서 거슬러 준다.

 이렇게 해서 for문을 끝까지 돌 수 있으면 true를 return했고 거스름돈을 주는 과정에서 카운트가 부족하면 false를 return하게 구현했다.