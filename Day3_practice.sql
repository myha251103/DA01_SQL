---bt1
select NAME from CITY
where POPULATION > 120000 and COUNTRYCODE = 'USA';
---bt2
select * from CITY
where COUNTRYCODE = 'JPN';
---bt3
select CITY, STATE from STATION;
---bt4 (Có cách nào để rút gọn câu này lại?)
select distinct CITY from STATION
where CITY like 'A%'  or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%';
---bt5
select distinct CITY from STATION
where CITY like '%a'  or CITY like '%e'  or CITY like '%i' or CITY like '%o' or CITY like '%u';
---bt6
select distinct CITY from STATION
where not (CITY like 'A%'  or CITY like 'E%' or CITY like 'I%' or CITY like 'O%' or CITY like 'U%');
---bt7
select name from Employee
order by name
---bt8
select name from Employee
where salary > 2000 and months < 10
order by employee_id;
---bt9
select product_id from Products
where low_fats = 'Y' and recyclable = 'Y';
---bt10 (is null???)
select name from Customer
where referee_id != 2 or referee_id is null;
---bt11
select name, population, area from World
where area >= 3000000 or population >= 25000000;
---bt12
select distinct author_id as id from Views
where viewer_id >= 1 and viewer_id = author_id
order by author_id;
---bt13
SELECT part, assembly_step FROM parts_assembly
where finish_date is null;
---bt14
select * from lyft_drivers
where yearly_salary <= 30000 or yearly_salary > 70000;
---bt15
select advertising_channel from uber_advertising
where year = 2019 and money_spent > 100000;
