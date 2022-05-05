class File:
    def __init__(self):
        self.removed = False
        self.before = None
        self.after = None

def solution(n, k, cmd):
    sheet = [File() for _ in range(n)]
    cur = sheet[k]
    works = []
    
    for idx in range(1,n):
        sheet[idx-1].after = sheet[idx]
        sheet[idx].before = sheet[idx-1]
    
    for c in cmd:
        if c[0] == "U":
            for _ in range(int(c[2:])):
                cur = cur.before
        elif c[0] == "D":
            for _ in range(int(c[2:])):
                cur = cur.after
        elif c[0] == "C":
            works.append(cur)
            cur.removed = True
            if cur.before:
                cur.before.after = cur.after
            if cur.after:
                cur.after.before = cur.before
                cur = cur.after
            else:
                cur = cur.before
        else:
            work = works.pop()
            work.removed = False
            if work.before:
                work.before.after = work
            if work.after:
                work.after.before = work

    return ''.join(['X' if f.removed else 'O' for f in sheet])
