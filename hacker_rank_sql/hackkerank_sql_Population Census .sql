select
    sum(city.population)
from
    city
left join
    country
on
    city.countrycode=country.code
where
    continent='Asia'