---bt1
SELECT
sum(case 
  when device_type = 'laptop' then 1
end) laptop_views,
sum(case 
  when device_type in ('tablet', 'phone') then 1
end) mobile_views
FROM viewership
---bt2
select *, 
case
    when x+y>z and y+z>x and x+z>y then 'Yes'
    else 'No'
end triangle
from Triangle;
---bt3 (why this code give 0.0?)
SELECT
round(sum(CASE
  when call_category = 'n/a' or call_category is null then 1
end)*100/count(case_id),1) as uncategorised_call_pct
FROM callers;
---bt4
select name from Customer
where referee_id != 2 or referee_id is null
---bt5
select survived,
sum(case
    when pclass = 1 then 1 
end) first_class,
sum(case
    when pclass = 2 then 1 
end) second_class,
sum(case
    when pclass = 3 then 1 
end) third_class
from titanic
group by survived
