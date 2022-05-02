from collections import defaultdict as dd
import re

def solution(word, pages):
    score = dd(list)#[인덱스, 기본점수, 외부링크들]
    mathcing_score = [0 for _ in range(len(pages))]

    for idx,html in enumerate(pages):
        html = html.lower()
        name = re.findall('<meta property="og:url" content="https://\S+"',html)[0].split('content=')[1].replace('"',"")
        score[name].append(idx)
        query = re.sub('[^a-z]',' ',html).split()
        score[name].append(query.count(word.lower()))
        score[name].append([n.split('"')[1] for n in re.findall('<a href="https://\S+>',html)])

    for key,link in score.items():
        mathcing_score[link[0]] += link[1]
        for external_link in link[2]:
            if external_link in score.keys():
                mathcing_score[score[external_link][0]] += link[1] / len(link[2])

    return mathcing_score.index(max(mathcing_score))
