#평행한지 따지고, 만나는점 따지고 만난다면 정수인지 따지고
#[A,B,C]
def solution(line):
    result = [[(line[i][1]*line[j][2] - line[i][2]*line[j][1])/
               (line[i][0]*line[j][1] - line[i][1]*line[j][0]),
               (line[i][2]*line[j][0] - line[i][0]*line[j][2])/
               (line[i][0]*line[j][1] - line[i][1]*line[j][0])]
              for i in range(len(line)-1)
              for j in range(i+1,len(line))
              if (line[i][0]*line[j][1] - line[i][1]*line[j][0]) != 0]
    result = [i for i in result if i[0]%1 == 0 and i[1]%1 == 0] # 소수 버리고
    x1,x2 = max(result, key = lambda x:x[0]),min(result, key = lambda x:x[0])
    y1,y2 = max(result, key = lambda x:x[1]),min(result, key = lambda x:x[1])
    answer = [''.join(['*' if [j,i] in result else '.' for j in range(int(x2[0]),int(x1[0])+1)])for i in reversed(range(int(y2[1]),int(y1[1])+1))]
    return answer
