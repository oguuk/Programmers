import sys
import copy

directions = [[-1, 0], [-1, -1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1]]
board = [[], [], [], []]
fishes = [[] for _ in range(16)]
answer = 0

for i in range(4):
    info = list(map(int, sys.stdin.readline().split()))
    for j in range(0, 8, 2):
        t = info[j:j+2]
        temp = [t[0] - 1, t[1] - 1]
        board[i].append(temp[0])
        fishes[temp[0]] = [i, j // 2, temp[1]]

def solution(pb, pf, sr, sc, count):
    global answer
    
    t_board = copy.deepcopy(pb)
    t_fish = copy.deepcopy(pf)
    
    fish_number = t_board[sr][sc]
    sd = t_fish[fish_number][2]
    t_fish[fish_number] = [-1, -1, -1]
    t_board[sr][sc] = -1
    
    count += (fish_number + 1)
    answer = max(answer, count)
    
    for i in range(16):
        if t_fish[i][0] == -1: continue
        cr, cc, cd = t_fish[i]
        nr, nc, nd = cr + directions[cd][0], cc + directions[cd][1], cd
        
        while nr < 0 or nr > 3 or nc < 0 or nc > 3 or (nr == sr and nc == sc):
            nd = (nd + 1) % 8
            nr, nc = cr + directions[nd][0], cc + directions[nd][1]
        
        if (t_board[nr][nc] != -1):
            target = t_board[nr][nc]
            t_fish[target][0] = cr
            t_fish[target][1] = cc
            t_fish[i] = [nr, nc, nd]
            
            t_board[nr][nc] = i
            t_board[cr][cc] = target
        else:
            t_fish[i] = [nr, nc, nd]
            
            t_board[nr][nc] = i
            t_board[cr][cc] = -1
    
    for i in range(4):
        nr = sr + directions[sd][0] * i
        nc = sc + directions[sd][1] * i
        if nr < 0 or nr > 3 or nc < 0 or nc > 3: break
        if t_board[nr][nc] != -1: 
            solution(t_board, t_fish, nr, nc, count)
            
solution(board, fishes, 0, 0, 0)
print(answer)