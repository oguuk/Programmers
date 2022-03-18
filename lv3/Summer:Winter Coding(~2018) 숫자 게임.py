from bisect import bisect_right as br
def solution(A, B):
    B.sort()
    answer = 0
    for a in A:
        idx = br(B,a)
        if idx < len(B):
            if B[idx] > a:
                answer+=1
                del B[idx]
        else:
            del B[0]
    return answer
