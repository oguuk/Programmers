N, M, R = map(int, input().split())
matrix = [list(map(int, input().split())) for _ in range(N)]

def rotate_border(matrix, x1, y1, x2, y2, R):
    temp = []
    for i in range(x1, x2): 
        temp.append(matrix[i][y1])
    for j in range(y1, y2):
        temp.append(matrix[x2][j])
    for i in range(x2, x1, -1):
        temp.append(matrix[i][y2])
    for j in range(y2, y1, -1): 
        temp.append(matrix[x1][j])

    l = len(temp)
    R %= l

    temp = temp[-R:] + temp[:-R]

    idx = 0
    for i in range(x1, x2):
        matrix[i][y1] = temp[idx]
        idx += 1
    for j in range(y1, y2):
        matrix[x2][j] = temp[idx]
        idx += 1
    for i in range(x2, x1, -1):
        matrix[i][y2] = temp[idx]
        idx += 1
    for j in range(y2, y1, -1):
        matrix[x1][j] = temp[idx]
        idx += 1

for layer in range(min(N, M) // 2):
    rotate_border(matrix, layer, layer, N-layer-1, M-layer-1, R)

for row in matrix:
    print(' '.join(map(str, row)))
