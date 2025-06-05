---bt1
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
    SELECT company_id
    FROM job_listings
    GROUP BY company_id
    HAVING COUNT(*) > 1
) AS duplicates;

---bt2
SELECT category, product, total_spend from (
select category, product, sum(spend) as total_spend, 
rank () over(partition by category order by sum(spend) desc) as rnk 
from product_spend
where EXTRACT(year FROM transaction_date) = 2022
group by product, category) sub
where rnk <= 2;

---bt3
SELECT count(policy_holder_id) 
FROM (
select policy_holder_id, count(case_id) 
from callers
group by policy_holder_id
having count(case_id) >= 3
) as policy_holder_count;

---bt4
SELECT p.page_id
FROM pages as p
LEFT JOIN page_likes AS l
  ON p.page_id = l.page_id
WHERE l.page_id IS NULL;

---bt5 (REDO)
SELECT 
  7 AS month,
  COUNT(DISTINCT ua1.user_id) AS monthly_active_users
FROM user_actions ua1
JOIN user_actions ua2 
  ON ua1.user_id = ua2.user_id
WHERE 
  ua1.event_type IN ('sign-in', 'like', 'comment')
  AND ua2.event_type IN ('sign-in', 'like', 'comment')
  AND EXTRACT(YEAR FROM ua1.event_date) = 2022
  AND EXTRACT(MONTH FROM ua1.event_date) = 7
  AND EXTRACT(YEAR FROM ua2.event_date) = 2022
  AND EXTRACT(MONTH FROM ua2.event_date) = 6;

---bt6 (tại sao không dùng được TO_CHAR nhỉ? Có phải là do MySQL ko ạ?)
select DATE_FORMAT(trans_date, '%Y-%m') as month, 
country, 
count(*) as trans_count,
count(case when state = 'approved' then 1 end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by month, country;

---bt7
select 
s.product_id, 
s. year as first_year, 
s.quantity,
s.price
from sales as s
join 
(select product_id, min(year) as first_year
from sales
group by product_id
) first_sale
on s.year = first_sale.first_year
and s.product_id = first_sale.product_id;

---em làm bt7 theo cách này leetcode accepted nhưng ChatGPT lại bảo sai ạ
select 
product_id, 
min(year) as first_year, 
quantity,
price
from sales 
group by product_id;

---bt8
select c.customer_id 
from customer as c
join product as p on c.product_key = p.product_key
group by c.customer_id
having count(distinct c.product_key) = (select count(*) from product);

---bt9
select employee_id 
from employees 
where salary < 30000
and manager_id not in (select employee_id from employees);

---bt10
SELECT COUNT(DISTINCT t1.company_id) AS duplicate_companies
FROM job_listings t1
JOIN job_listings t2 
  ON t1.company_id = t2.company_id
 AND t1.title = t2.title
 AND t1.description = t2.description
 AND t1.job_id < t2.job_id; 

---bt11
(select u.name as results from Users as u
join MovieRating as mr on u.user_id = mr.user_id
group by u.user_id
order by count(*) desc, u.name asc
limit 1) 
UNION
(select m.title as results from movies as m
join MovieRating as mr on m.movie_id = mr.movie_id    
where mr.created_at like '2020-02-%'
group by m.movie_id
order by avg(rating) desc, m.title asc
limit 1
);

---bt12
SELECT requester_id AS id, COUNT(*) AS num 
FROM (
  SELECT requester_id FROM RequestAccepted 
  UNION ALL
  SELECT accepter_id FROM RequestAccepted
) AS all_ids
GROUP BY requester_id 
ORDER BY num DESC
LIMIT 1;


