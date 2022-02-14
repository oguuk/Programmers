def solution(arr):
    a = len(arr)//2
    if sum(sum(arr,[])) == len(arr)**2:
        return [0,1]
    elif sum(sum(arr,[])) == 0:
        return [1,0]
    return [sum(i) for i in zip(solution([j[:a]for j in arr[:a]]),solution([ j[a:]for j in arr[:a]]),solution([j[a:]for j in arr[a:]]),solution([j[:a]for j in arr[a:]]))]
