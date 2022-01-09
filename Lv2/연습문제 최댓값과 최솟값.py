import re
def solution(s):
    slice = [int(i) for i in re.findall('(\D?\d+)',s)]
    return "%d %d"%(min(slice),max(slice))
