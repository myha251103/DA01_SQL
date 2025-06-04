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

---bt5

---bt6 (tại sao không dùng được TO_CHAR nhỉ?)
select DATE_FORMAT(trans_date, '%Y-%m') as month, 
country, 
count(*) as trans_count,
count(case when state = 'approved' then 1 end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by month, country;



