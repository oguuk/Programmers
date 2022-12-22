def solution(elements):
    answer = 0
    partial = list()
    temp_el = elements*2

    for i in range(1,len(elements)+1):
        for j in range(len(elements)):
            partial.append(sum(temp_el[j:j+i]))

    answer = len(set(partial))


    return answer