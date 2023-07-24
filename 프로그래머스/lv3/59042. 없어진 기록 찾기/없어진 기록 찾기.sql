select b.animal_id, b.name
from ANIMAL_INS a right join ANIMAL_OUTS b on a.animal_id = b.animal_id
where a.intake_condition is null
order by b. animal_id
