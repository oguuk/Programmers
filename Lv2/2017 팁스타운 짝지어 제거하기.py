def solution(s):
    end = len(s)
    s = list(s)
    s.reverse()
    que = []
    count = 0
    while True:#s의 문자열을 deque에 다 옮기기까지
        if len(que)>1:
            if que[len(que)-1] == que[len(que)-2]:
                que.pop()
                que.pop()
                continue
        if not s:
            if not que:
                return 1
            else:
                return 0
        que.append(s.pop())
        count +=1
