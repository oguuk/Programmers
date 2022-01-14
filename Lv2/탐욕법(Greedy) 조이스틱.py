#1. N을 기준으로 A와 가까운지 Z와 가까운지
#2. 앞과 뒤의 연속된 'A'의 개수로 방향 결정
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
