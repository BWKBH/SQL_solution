select
    country.continent
    , floor(avg(city.population))
from
    city
inner join
    country
on
    city.COUNTRYCODE=COUNTRY.CODE
group by
    country.continent