with firstsum as (
    select flavor, sum(total_order) sum
    from first_half
    group by flavor
), julysum as (
    select flavor, sum(total_order) sum
    from july
    group by flavor
), result as (
    select f.flavor, sum(f.sum + j.sum) sum
    from firstsum f
    join julysum j on f.flavor = j.flavor
    group by f.flavor
)

select flavor
from result
order by sum desc limit 3
