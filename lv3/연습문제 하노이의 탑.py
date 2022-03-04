solution = lambda n,i = 1,f = 3: [[i,f]]if n == 1 else solution(n-1,i,6-i-f) + solution(1,i,f) + solution(n-1,6-i-f,f)
