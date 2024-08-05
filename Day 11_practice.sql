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
