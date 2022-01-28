from collections import deque as dq
def solution(rows, columns, queries):
    map_ = [[j for j in range(1+columns*(i-1),columns*i+1)] for i in range(1,rows+1)]
    answer = []
    for i in queries:
        temp,num = [],0
        temp.append(map_[i[0]-1][i[1]-1:i[3]])
        temp.append([j[i[3]-1] for j in map_[i[0]:i[2]]])
        temp.append(list(reversed(map_[i[2]-1][i[1]-1:i[3]-1])))
        temp.append(list(reversed([j[i[1]-1] for j in map_[i[0]:i[2]-1]])))
        rotating = dq(sum(temp,[]))
        rotating.rotate(1)
        temp = list(rotating)
        answer.append(min(temp))
        map_[i[0]-1][i[1]-1:i[3]] = temp[:i[3]-i[1]+1]
        for j in range(i[0],i[2]):
            num +=1
            map_[j][i[3]-1] = temp[i[3]-i[1]+num]
        map_[i[2]-1][i[1]-1:i[3]-1] = temp[2*(i[3]-i[1])+num:i[3]-i[1]+num:-1]
        for j in range(i[0],i[2]-1):
            map_[j][i[1]-1] = rotating.pop()
    return answer

# 1/28 23:23
'''
직관적으로 문제 설명 그대로 해결하였다.
테두리를 입력받고 deque 라이브러리로 rotate한 뒤 다시 리스트에 옮겨 map_(n*n 행렬)에 해당 인덱스에
다시 입력하는 식으로 해결하였다.

고민되는 점은 문제의 아규먼트인 queries 4개의 숫자를 이용하여 규칙화하여 클린코드로 작성할 수 있을 것 같다.
예를 들어, 왼쪽 상단 끝을 시작점으로 한다면(a,b,c,d)->행 열 행 열
첫 번째는 [a-1][b-1:d]
두 번째는 [a][d-1] ~ [c][d-1]
세 번째는 [c-1][b:d-1]
네 번째는 [a][b-1] ~ [c-1][b-1] 인데 이용 방법을 생각해봐야겠다.

오늘은 아무래도 github 잔디를 심어야해서 일단 올리고 다음에 review를 해야겠다.
'''
