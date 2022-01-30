def solution(msg):
    num, count = 2, 27
    dic, answer = {}, []
    while msg:
        string = msg[:num]
        if msg[:num] in dic:
            num += 1
            if string == msg[:num]:
                answer.append(dic[string])
                break
        else:
            if num > 2:  # 없는 것을 찾아낸 경우
                answer.append(dic[msg[:num - 1]])
                dic[msg[:num]] = count
                msg = msg[num - 1:]
                count += 1
                num = 2
            else:
                answer.append(ord(msg[0]) - 64)
                dic[msg[:num]] = count
                count += 1
                msg = msg[1:]
    return answer

# 1/30 23:43 코로나 양성 ㅠ
