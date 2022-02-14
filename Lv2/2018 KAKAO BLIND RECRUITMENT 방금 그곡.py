def solution(m, musicinfos):
    musicinfos = [i.split(',')for i in musicinfos]
    m = change(m)
    answer = {}
    for i in musicinfos:
        a = len(i[3])
        i[1] = (int(i[1][:2])*60+int(i[1][3:]))-(int(i[0][:2])*60+int(i[0][3:]))
        i[3] = change(''.join([i[3][j%a] for j in range(i[1]+300)]))
        if m in i[3]:
            answer[i[2]] = i[1]
    return max(answer,key = lambda x:answer[x]) if answer else "(None)"

def change(string):
    num = {'C#':'1','D#': '2', 'F#': '3', 'G#': '4', 'A#': '5'}
    for i in range(len(string)-1):
        if string[i:i+2] in num.keys():
            string = string[:i] + num[string[i:i+2]] + string[i+2:]
    return string
