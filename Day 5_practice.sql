---bt1
select distinct CITY from STATION
where ID%2=0
---bt2
select count( city) - count(distinct city) from station
---bt3
