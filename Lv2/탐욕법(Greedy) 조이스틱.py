#1. N을 기준으로 A와 가까운지 Z와 가까운지
#2. 앞과 뒤의 연속된 'A'의 개수로 방향 결정

#처음 작성했던 코드
def solution(name):
    answer = 0
    front = 0
    back = 0
    
    if name[0] <= 'N':
        answer += ord(name[0])-65
    else:
        answer += 91 - ord(name[0])
        
    while True:
        for i in range(1,len(name)):
            if name[i] != 'A':
                break
            front +=1
        for j in range(len(name)-1,0,-1):
            if name[j] != 'A':
                break
            back +=1
        break
        
    if front <= back:#앞으로 진행
        answer += len(name)-(back+1)
        for i in range(1,len(name)-back):
            if name[i] <= 'N':
                answer += ord(name[i])-65
            else:
                answer += 91 - ord(name[i])
    else:#뒤로 진행
        answer += len(name)-(1+front)
        for j in range(len(name)-1,front,-1):
            if name[j] <= 'N':
                answer += ord(name[j])-65
            else:
                answer += 91 - ord(name[j])
    return answer

# 다시 작성한 코드 1/25 23:10
# 처음 작성한 코드는 연속된 A의 개수에 의해서 값을 유추해 내는 말 그대로 너무 greedy한 방법이어서 반례가 너무 많았다.
# 다시 생각한 알고리즘은 다음과 같다.
# 1. 어차피 알파벳을 변경하는 값은 location에 상관없이 고정이므로 먼저 ord메소드를 사용하여 중앙값 M의 아스키코드 값(78)을 기준으로 N보다 작으면 그 값에서 A의 아스키 코드 값을 빼고 아니라면 Z(90)에 1을 더하여 뺀 값을 모두 구하여 sum 함수를 통해 answer에 저장한다.
# greedy로 풀면 거리가 같은 경우 왼쪽이냐 오른쪽이냐에 따라 닶이 달라지는 경우가 생긴다
# 예로 "AABAAAAABBB"의 답은 11인데 greedy의 경우 왼쪽으로 가서 12가 나오는 경우가 생기니 시작점을 0과,-1인 경우로 나눠서 최소값 반환하는 알고리즘으로 해결.

def solution(name):
    num_list = [ord(i) - 65 if ord(i) <= 78 else 91 - ord(i) for i in name]
    result = []
    flag =0
    location = 1
    while flag < 2:
        front,back = 1,-1
        answer= sum(num_list)
        num = answer-num_list[0]
        while True:
            if num == 0:
                break
            for i in range(front,len(num_list)+back):
                if i and num_list[i]:
                    front = i
                    break
            for j in range(back,-len(num_list),-1):
                if num_list[j]:
                    back = j
                    break
            if front-location >= location-back:
                answer += location-back
                num -=num_list[back]
                location = back
                back -=1
            else:
                answer += front-location
                num -=num_list[front]
                location = front
                front +=1
        result.append(answer)
        flag +=1
        location = -1
    return min(result)+1 if min(result) != 0 else 0
