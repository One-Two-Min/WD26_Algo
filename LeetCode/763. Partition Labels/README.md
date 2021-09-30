# 763. Partition Labels



## 풀이

주어진 예제의 "ababcbacadefegdehijhklij"로 살펴보자.

 먼저 주어진 문자열을 for문을 한 번 돌아서 alphabet 배열에 해당 문자의 가장 마지막 인덱스를 기록했다. 예를 들어서 예제의 문자열을 살펴보면 alphabet['a']에는 'a'가 있는 가장 마지막 인덱스인 8이 기록되고 alphabet['b']에는 'b'가 있는 가장 마지막 인덱스인 5가 기록된다. (인덱스 번호는 아스키를 사용했지만 편의상 ['a']와 같이 표기)

 그 후 다시 for문을 돌면서 다음과 과정을 거친다

(1) a는 아직 방문전이고 start_idx = 0, end_idx = 8로 설정된다.

![Untitled](https://user-images.githubusercontent.com/91004864/135483315-0fe682fb-0f6c-485d-b9ad-c66ddd89ea91.png)

(2) b는 아직 방문전이다. b의 마지막 인덱스는 5이고 이전에 설정된 end_idx보다 작으므로 end_idx는 갱신되지 않는다.

![Untitled 1](https://user-images.githubusercontent.com/91004864/135483410-c5e45574-df78-4d44-a639-6dcbeb69b4c4.png)

(3) c는 아직 방문전이다. c의 마지막 인덱스는 7이고 이전에 설정된 end_idx보다 작으므로 end_idx는 갱신되지 않는다.

![Untitled 2](https://user-images.githubusercontent.com/91004864/135483476-c197efdd-8854-4982-aab7-4dfda723fd45.png)

(4) 이제 idx와 end_idx가 같은 위치에서 만나게 되고 end_idx - start_idx + 1을 통해 이 구간의 길이를 구해서 결과 배열에 넣어준다. 그 후 start_idx는 다음 인덱스인 9로 설정되고 위와 같은 과정을 반복한다.