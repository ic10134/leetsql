CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select 
    max(salary) AS getNthHighestSalary
    from
    (select
    salary,
    dense_rank() over(order by salary desc) as rank_desc
    from employee) cor_qry
    where rank_desc=N   
  );
END