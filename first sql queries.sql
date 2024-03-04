SELECT * FROM pizza_sales_details.`hr data_excel`;
with cte as (select (select count(*)+
(with cte as(select count(*)as employee_count from `hr data_excel`) ,cte2 as
(select count(*) as attrition_count from `hr data_excel`
where Attrition="yes")
select employee_count -attrition_count from cte join cte2) 
as remaining_employee from `hr data_excel`)/2 as avg_employee),
cte2 as (select count(*) as attrition_count from `hr data_excel` where Attrition="yes")
select attrition_count*100/ avg_employee as attrition_rate from cte join cte2 ;
select round(avg(Age),0) as avg_age from `hr data_excel` ;


SELECT
  AGE_GROUP,Gender,
  COUNT(*) AS EMPLOYEE_COUNT
FROM (
  SELECT GENDER,ATTRITION,
    CASE
      WHEN AGE <25 THEN 'under25'
	WHEN AGE between 25 and 34 then "25-34"
    WHEN AGE BETWEEN 35 AND 44 THEN "35-44"
    WHEN AGE BETWEEN 45 AND 54  THEN "45-54"
      WHEN AGE >55 THEN "OVER55"
      END AS AGE_GROUP
  FROM `hr data_excel`
) AS grouped_data
WHERE ATTRITION="YES"
GROUP BY AGE_GROUP, GENDER
ORDER BY AGE_GROUP;
SELECT `Job Satisfaction`,COUNT(*)
FROM `hr data_excel`
GROUP BY `Job Satisfaction`
ORDER BY `Job Satisfaction`;
select `Education Field`,count(*)
from `hr data_excel`
where attrition="yes"
group by `Education Field`
order by count(*) desc;



