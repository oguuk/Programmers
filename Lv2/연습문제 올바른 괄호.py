def solution(s):
    bracket = 0
    for i in s:
        if i == "(":
            bracket +=1
        else:
            if bracket <= 0:
                return False
            bracket -=1
    if bracket > 0:
        return False
    else:
        return True
