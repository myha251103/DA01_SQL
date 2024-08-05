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
