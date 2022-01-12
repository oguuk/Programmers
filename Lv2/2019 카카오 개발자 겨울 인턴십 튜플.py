def solution(s):
    numbers = []
    answer = []
    num = []
    save = []
    flag = 0
    for i in s:
        if i == '{':
            flag = 1
            continue
        else:
            if i == '}':
                if len(num) > 0:
                    save.append(int(''.join(num)))
                flag = 0
                numbers.append(save)
                save = []
                num= []
                continue
            if flag:
                if i == ',':
                    save.append(int(''.join(num)))
                    num = []
                    continue
                num.append(i)
    numbers = sorted(numbers,key = lambda x:len(x))
    del numbers[0]
    for j in numbers:
        for k in j:
            if k not in answer:
                answer.append(k)
    return answer
