---bt1
select 
name
from STUDENTS
where marks > 75
order by right(name, 3), ID 
---bt2 (vì sao ko thể dùng như này? -> upper(left(name,1))||lower(right(name, length(name)-1))) as name???)
select user_id,
concat(upper(left(name,1)), lower(right(name, length(name)-1))) as name
from Users
order by user_id;
---bt3
SELECT manufacturer,
concat('$',round(sum(total_sales)/1000000,0), ' million') as sale
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer;
---bt4
SELECT 
extract(month from submit_date) as mth,
product_id,
round(avg(stars),2) as avg_stars
FROM reviews
group by mth, product_id
order by mth, product_id;
---bt5
SELECT sender_id,
count(content) as message_count
FROM messages
where extract(month from sent_date) = 8 and extract(year from sent_date) = 2022
group by sender_id
order by message_count desc
limit 2
---bt6
select tweet_id from Tweets
where length(content) > 15
---bt7
...
---bt8
select 
count(id)
from employees
where extract(month from joining_date) between 1 and 7 
and extract(year from joining_date) = 2022 
---bt9
select 
position('a' in first_name) as pos
from worker
where first_name = 'Amitah'
---bt10
select 
substring(title from length(winery)+2 for 4) as year
from winemag_p2
where country = 'Macedonia'
