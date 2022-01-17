def solution(id_list, report, k):
    report_times,who_report,id_dic = {},{},{}
    for i in id_list:
        id_dic[i] = 0
    for i in report:
        if i.split()[0] in who_report.keys():
            who_report[i.split()[0]].add(i.split()[1])
        else:
            who_report[i.split()[0]] = {i.split()[1]}
        if i.split()[1] in report_times.keys():
            report_times[i.split()[1]].add(i.split()[0])
        else:
            report_times[i.split()[1]] = {i.split()[0]}
    for i in who_report.keys():
            for j in who_report[i]:
                if j in report_times.keys() and len(report_times[j]) >= k:
                    id_dic[i] +=1
    return list(id_dic.values())
