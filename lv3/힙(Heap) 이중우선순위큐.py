def solution(operations):
    answer = []
    for i in operations:
        if i[0] == "I":
            answer.append(int(i[2:]))
        else:
            if answer:
                if i[2] == "1":#최대값 빼라
                    answer = list(set(answer)^set([max(answer)]))
                else:
                    answer = list(set(answer)^set([min(answer)]))
    return [max(answer),min(answer)] if answer else [0,0]
