from collections import deque #1차 시도
def solution(s):
    cut = 1
    count = 0
    save = ""
    strings = ["" for i in range(len(s)//2)]
    while True:
        if cut == len(s)//2 +1:
            break
        string = [s[i:i+cut] for i in range(0,len(s),cut)]
        save += string[0]
        count = 1
        flag = 0
        for i in range(len(string)-1):
            if string[i] == string[i+1]:
                save = string[i]
                count += 1
            else:
                if count > 1:
                    strings[cut-1] += "%d"%(count) + save
                else:
                    strings[cut-1] += string[i]
                    if i == len(string)-2:
                        strings[cut-1] += string[i+1]
                        continue
                count = 1
            if i == len(string)-2:
                strings[cut-1] += "%d"%(count) + save
        cut +=1
    return min([len(i) for i in strings])


//수정후
def solution(s):
    cut = 1
    count = 0
    save = ""
    strings = ["" for i in range(len(s)//2)]
    if len(s) == 1:
        return 1
    while True:
        if cut == len(s)//2 +1:
            break
        string = [s[i:i+cut] for i in range(0,len(s),cut)]
        save += string[0]
        count = 1
        for i in range(len(string)-1):
            if string[i] == string[i+1]:
                save = string[i]
                count += 1
            else:
                if count > 1:
                    strings[cut-1] += "%d"%(count) + save
                    count = 1
                else:
                    strings[cut-1] += string[i]

            if i == len(string)-2:
                if string[len(string)-2] != string[len(string)-1]:
                    strings[cut-1] += string[i+1]
                else:
                    strings[cut-1] += "%d"%(count) + save

        cut +=1
    return min([len(i) for i in strings])
