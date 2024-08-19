---bt1
select distinct replacement_cost from film
order by replacement_cost
---bt2
SELECT
    SUM(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 ELSE 0 END) AS low,
    SUM(CASE WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 1 ELSE 0 END) AS mid,
    SUM(CASE WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 1 ELSE 0 END) AS high
FROM film;
---bt3
SELECT a.title, a.length, c.name
FROM film as a 
join film_category as b on a.film_id = b.film_id
join category as c on b.category_id = c.category_id
where c.name in ('Drama', 'Sports')
order by a.length desc limit 1;
---bt4
SELECT c.name, count(a.title)
FROM film as a 
join film_category as b on a.film_id = b.film_id
join category as c on b.category_id = c.category_id
group by c.name
order by count(a.title) desc
---bt5
SELECT a.first_name, a.last_name, count(b.film_id)
from actor as a
join film_actor as b on a.actor_id = b.actor_id
group by a.first_name, a.last_name
order by count(b.film_id) desc
---bt6
SELECT count(*)
FROM address AS a
LEFT JOIN customer AS b ON a.address_id = b.address_id
WHERE b.address_id IS NULL;
---bt7
SELECT a.city, sum(d.amount)
from city as a
join address as b on a.city_id = b.city_id
join customer as c on b.address_id = c.address_id
join payment as d on c.customer_id = d.customer_id
group by a.city
order by sum(d.amount) desc
---bt8
SELECT a.city, e.country, sum(d.amount)
from city as a
join address as b on a.city_id = b.city_id
join customer as c on b.address_id = c.address_id
join payment as d on c.customer_id = d.customer_id
join country as e on a.country_id = e.country_id
group by e.country, a.city
order by sum(d.amount) desc
