select
    city.name
from
    city
left join
    country
on
    city.countrycode=country.code
where
    continent='Africa'