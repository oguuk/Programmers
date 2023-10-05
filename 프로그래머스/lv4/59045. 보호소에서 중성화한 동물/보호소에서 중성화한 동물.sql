select o.animal_id, o.ANIMAL_TYPE, o.NAME
from animal_ins i
left join animal_outs o on i.animal_id = o.animal_id
where i.SEX_UPON_INTAKE like 'Intact%' 
and (o.SEX_UPON_OUTCOME like 'Neutered Male' or o.SEX_UPON_OUTCOME like 'Spayed Female') 
order by animal_id