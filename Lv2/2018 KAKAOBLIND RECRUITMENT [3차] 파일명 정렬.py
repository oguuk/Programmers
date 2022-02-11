#head,number,tail 3부분으로 나눠서 정렬
def solution(files):
    hnt = []
    for file in files:
        num,num2,temp = 0,0,[]
        for i in file:
            if i.isdigit():
                break
            num +=1
        temp.append(file[:num])
        num2 += num
        for i in range(num,len(file)):
            if not file[i].isdigit() or i > num+4:
                break
            num2+=1
        temp.append(file[num:num2])
        if num2 < len(file)-1:
            temp.append(file[num2:])
        hnt.append(temp)

    hnt.sort(key = lambda x:(x[0].upper(),int(x[1])))


    return [''.join(i) for i in hnt]
