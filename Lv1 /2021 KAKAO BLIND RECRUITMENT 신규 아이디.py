def solution(new_id):
    answer = ''
    special = "~!@#$%^&*()=+[{]}:?,<>/"
    new_id = new_id.lower()
    new_id = ''.join( i for i in new_id if i not in special)
    while '..' in new_id:
        new_id = new_id.replace('..','.')
    new_id = new_id.strip('.')
    if not new_id:
        new_id = "aaa"
    if len(new_id) > 15:
        new_id = new_id[:15]
        new_id = new_id.strip('.')
    if len(new_id) < 3:
        new_id += new_id[len(new_id)-1]*3
        new_id = new_id[:3]
        
    return new_id
