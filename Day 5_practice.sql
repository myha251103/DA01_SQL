---bt1
select distinct CITY from STATION
where ID%2=0
---bt2
select count( city) - count(distinct city) from station
---bt3
select ceiling(avg(salary) - avg(replace(salary, '0', '')))
from EMPLOYEES  
---bt4
SELECT 
round(cast(sum(item_count*order_occurrences)/sum(order_occurrences) as DECIMAL), 1) as mean
FROM items_per_order;
---bt5 (error?!)
select candidate_id
from candidate
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(skill) = 3;
---bt6
SELECT  
user_id,
DATE(max(post_date))-DATE(min(post_date)) as days_between
FROM posts
where post_date >= '2021-01-01' and post_date <= '2022-01-01'
group by user_id
having count(post_id)>= 2;
---bt7
SELECT 
card_name,
max(issued_amount) - min(issued_amount) as difference
FROM monthly_cards_issued
group by card_name
order by difference DESC
---bt8
SELECT 
manufacturer,
count(drug) as drug_count,
abs(sum(cogs-total_sales)) as total_loss
FROM pharmacy_sales
where total_sales<cogs
group by manufacturer
order by total_loss DESC
---bt9
select * from Cinema
where id%2 = 1 and description != 'boring'
order by rating desc
---bt10
select teacher_id,
count( distinct subject_id) as cnt
from Teacher
group by teacher_id
---bt11
select user_id,
count(distinct follower_id) as followers_count
from Followers
group by user_id
order by user_id
---bt12 (tại sao ko có "group by class" thì code này vẫn đúng?)
select class from Courses
having count(student) >=5
