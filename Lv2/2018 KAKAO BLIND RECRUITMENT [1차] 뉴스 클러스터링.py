def solution(str1, str2):
    str1Dic,str2Dic = {},{}
    str1,str2 = str1.upper(),str2.upper()
    make_key(str1Dic,str1)
    make_key(str2Dic,str2)
    up = sum([min(str1Dic[i],str2Dic[i]) for i in list(str1Dic.keys()&str2Dic.keys())])
    down = sum([ max(str1Dic[i] if i in str1Dic.keys() else 0 ,str2Dic[i] if i in str2Dic.keys() else 0 ) for i in list(str1Dic.keys()|str2Dic.keys())])
    return int(65536*(up/down)) if down else 65536*1
    

def make_key(Dic,str1):
    for i in range(len(str1)-1):
        if 65 <= ord(str1[i]) <= 90 and 65 <= ord(str1[i+1]) <= 90:
            if str1[i]+str1[i+1] not in Dic:
                Dic[str1[i]+str1[i+1]] = 1
            else:
                Dic[str1[i]+str1[i+1]] += 1
