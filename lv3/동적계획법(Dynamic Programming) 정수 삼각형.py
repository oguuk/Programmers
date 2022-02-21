def solution(triangle):
    
    if len(triangle) == 1:
        return max(sum(triangle,[]))
    
    for i in range(len(triangle[1])):
        if i == 0:#제일 왼쪽
            triangle[1][i] += triangle[0][0]
        elif i == len(triangle[1])-1:#제일 오른쪽
            triangle[1][i] += triangle[0][-1]
        else:#2가지가 선택 가능한 노드
            triangle[1][i] += max(triangle[0][i-1],triangle[0][i])

    return solution(triangle[1:])
