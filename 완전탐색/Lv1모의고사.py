def solution(answers):
    a = b = c = 0
    first = [1,2,3,4,5]
    second = [2,1,2,3,2,4,2,5]
    third = [3,3,1,1,2,2,4,4,5,5]
    for i in range(len(answers)):
        if answers[i] == first[i%5]:
            a+=1
        if answers[i] == second[i%8]:
            b+=1
        if answers[i] == third[i%10]:
            c+=1
    answer1 = [[a,1],[b,2],[c,3]]
    answer1.sort(reverse=True)
    ans = []
    answer = [answer1[0][1],answer1[1][1],answer1[2][1]]
    
    if answer1[0][0] == answer1[1][0] == answer1[2][0]:
        answer.sort()
        return answer
    if answer1[0][0] == answer1[1][0]:
        ans = [answer[1],answer[0]]
        return ans
        
    return answer[:1]
