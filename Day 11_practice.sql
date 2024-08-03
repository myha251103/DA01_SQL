---bt1
select b.continent, floor(avg(a.population))
from city as a
inner join country as b on a.COUNTRYCODE = b.CODE
group by b.CONTINENT;
