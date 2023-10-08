import sys
from collections import deque 

n, m, k = map(int, sys.stdin.readline().split())
board = []
answer = 0
dice = [1, 2, 3, 5, 4, 6] # 위, 북, 동, 남, 서, 바닥
way = 1 # 0 북 1 동 2 남 3 서
curr = [0, 0]

def bfs(r, c, num):
    global answer
    
    directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    q = deque([[r, c]])
    isVisit = [[False for _ in range(m)] for _ in range(n)]
    
    while q:
        row, col = q.popleft()
        
        if row < 0 or col < 0 or row >= n or col >= m or isVisit[row][col]: continue
        if board[row][col] != num: continue
            
        isVisit[row][col] = True
        answer += num
        
        for d in directions: 
            q.append([row + d[0], col + d[1]])
            
    answer -= num

def change_dice(n):
    global dice
    
    if n == 0: #위로
        dice = [dice[3], dice[0], dice[2], dice[5], dice[4], dice[1]]
    elif n == 1: #오른쪽으로
        dice = [dice[4], dice[1], dice[0], dice[3], dice[5], dice[2]]
    elif n == 2: #아래로
        dice = [dice[1], dice[5], dice[2], dice[0], dice[4], dice[3]]
    elif n == 3: #왼쪽으로
        dice = [dice[2], dice[1], dice[5], dice[3], dice[0], dice[4]]
    
    
def rotate(a, b):
    global way, dice
    
    if a > b:
        way = (way + 1) % 4
    elif a < b:
        way = (way - 1 if way - 1 >= 0 else 3) % 4

def roll_dice():
    global way, curr
    
    if way == 0:
        if curr[0] <= 0:
            way = 2
            roll_dice()
        else:
            curr = [curr[0] - 1, curr[1]]
        
    elif way == 1:
        if curr[1] >= m - 1:
            way = 3
            roll_dice()
        else:
            curr = [curr[0], curr[1] + 1]
    elif way == 2:
        if curr[0] >= n - 1:
            way = 0
            roll_dice()
        else:
            curr = [curr[0] + 1, curr[1]]
    else:
        if curr[1] <= 0:
            way = 1
            roll_dice()
        else:
            curr = [curr[0], curr[1] - 1]
    return

for _ in range(n):
    input = list(map(int, sys.stdin.readline().split()))
    board.append(input)

for i in range(k):
    roll_dice()
    change_dice(way)
    rotate(dice[5], board[curr[0]][curr[1]])
    bfs(curr[0], curr[1], board[curr[0]][curr[1]])
    answer += board[curr[0]][curr[1]]

print(answer)