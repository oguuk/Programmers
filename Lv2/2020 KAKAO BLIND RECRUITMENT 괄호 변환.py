def solution(p):
    if p =='':
        return ''
    u,v = well_balanced(p)
    if isright(u):#1~3
        return u + solution(v)
    return '('+ solution(v) +')' + ''.join([')'if u[i] == '(' else '(' for i in range(1,len(u)-1)])

def well_balanced(p):#2~3번
    o,c = 0,0
    u,v = '',''
    for i in range(len(p)):
        if p[i] == '(':
            o +=1
            u+='('
        else:
            c +=1
            u+=')'
        if o == c:
            if i == len(p)-1:
                return u,''
            return u,p[i+1:]
                
def isright(p):
    o,c = 0,0
    if p[0] == ')':
        return False
    else:
        for i in range(len(p)):
            if p[i] == '(':
                o +=1
            else:
                c +=1
            if c > o:
                return False
    return True
