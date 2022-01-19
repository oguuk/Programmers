def solution(skill, skill_trees):
    answer = 0
    for i in skill_trees:
        check = ""
        count = 0
        for j in i:
            if j in skill:
                check += j
        for k in check:
            if k != skill[count]:
                break
            if k == check[-1]:
                answer +=1
            count +=1
    return answer
