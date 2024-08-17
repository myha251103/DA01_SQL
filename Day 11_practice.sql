---bt1
select b.continent, floor(avg(a.population))
from city as a
inner join country as b on a.COUNTRYCODE = b.CODE
group by b.CONTINENT;
---bt2
select round(cast(count(t2.email_id)as decimal)/count(t1.email_id),2) as activation_rate
from emails as t1
left join texts as t2 on t1.email_id = t2.email_id 
and t2.signup_action = 'Confirmed';

vì sao bt2 version bên dưới đây lại có kq bằng 0?
select round(cast(count(t2.email_id)/count(t1.email_id) as decimal),2) as activation_rate
from emails as t1
left join texts as t2 on t1.email_id = t2.email_id 
and t2.signup_action = 'Confirmed';

---bt3
select t1.age_bucket,
round(100.0*sum(case 
  when t2.activity_type = 'send' then t2.time_spent
else 0 end)/sum(t2.time_spent),2) as send_perc,
round(100.0*sum(case 
  when t2.activity_type = 'open' then t2.time_spent
else 0 end)/sum(t2.time_spent),2) as open_perc
from age_breakdown as t1
inner join activities as t2 on t1.user_id = t2.user_id
where t2.activity_type in ('send', 'open')
group by t1.age_bucket;
---bt4 (output có đúng ko và yêu cầu của đề là gì?)
SELECT a.customer_id, 
FROM customer_contracts as a
inner join products as b on a.product_id = b.product_id
where b.product_name LIKE '%Azure%';
---bt5
select a.employee_id, a.name, count(b.reports_to) as reports_count, round(avg(b.age)) as average_age
from Employees as a
left join Employees as b on a.employee_id = b.reports_to
group by a.employee_id, a.name
having reports_count != 0 and average_age is not null
---bt6
select a.product_name, sum(b.unit) as unit
from Products as a
inner join Orders as b on a.product_id = b.product_id
where year(b.order_date) = 2020 and month(b.order_date) = 2
group by a.product_name
having sum(b.unit)>=100
---bt7

