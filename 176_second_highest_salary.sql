select 
    case 
        when  max(rank_desc) <> 1 then salary
              else null    
        end AS SecondHighestSalary
from
(select
    salary,
    dense_rank() over(order by salary desc) as rank_desc
from employee) cor_qry
where rank_desc=2
;