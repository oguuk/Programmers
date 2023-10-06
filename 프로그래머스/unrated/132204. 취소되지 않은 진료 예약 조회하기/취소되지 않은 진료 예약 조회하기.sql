with A as (
    select a.apnt_no, p.pt_name, a.pt_no, a.mcdp_cd, d.dr_name, a.apnt_ymd
    from appointment a
    join patient p on a.pt_no = p.pt_no
    join doctor d on a.mddr_id = d.dr_id and a.mcdp_cd = d.mcdp_cd
    where a.apnt_ymd like '2022-04-13%' 
    and a.mcdp_cd like 'CS' 
    and a.APNT_CNCL_YN = 'N'
)

select apnt_no, pt_name, pt_no, mcdp_cd, dr_name, apnt_ymd
from A
order by APNT_YMD
