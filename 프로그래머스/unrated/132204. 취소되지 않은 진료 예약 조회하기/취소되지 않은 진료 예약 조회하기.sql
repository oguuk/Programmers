select a.APNT_NO, a.PT_NAME, a.PT_NO, b.MCDP_CD, b.DR_NAME, a.APNT_YMD
from (select a.APNT_NO, p.PT_NAME, a.PT_NO, a.APNT_YMD
      from APPOINTMENT a
      left join PATIENT p on a.PT_NO = p.PT_NO
      where isnull(a.APNT_CNCL_YMD)
     ) a
left join (select a.APNT_NO, a.PT_NO, a.MCDP_CD, d.DR_NAME, a.APNT_YMD
           from APPOINTMENT a
           left join DOCTOR d on a.MDDR_ID = d.DR_ID
           where isnull(a.APNT_CNCL_YMD)
          ) b on a.APNT_YMD = b.APNT_YMD and a.APNT_NO = b.APNT_NO
where MCDP_CD = 'CS' and a.APNT_YMD like '2022-04-13%'
order by APNT_YMD