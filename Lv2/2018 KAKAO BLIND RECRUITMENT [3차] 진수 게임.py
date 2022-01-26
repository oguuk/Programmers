def solution(n, t, m, p):
    global all_num
    all_num = 's0'
    answer = ''
    convert(n,t,m)
    return ''.join([ all_num[p+m*i] for i in range(0,t)])

def convert(n,t,m):
    global all_num
    num = t*m
    for i in range(num):
        temp = ""
        while i > 0:
            if i%n >= 10:
                temp += chr(i%n+55)
            else:
                temp += str(i%n)
            i = i//n
        all_num += temp[::-1]
    return all_num
