select o.ANIMAL_ID, o.name
from ANIMAL_OUTS o
left join ANIMAL_INS i on i.ANIMAL_ID = o.ANIMAL_ID
where isnull(i.animal_type)
order by o.ANIMAL_ID