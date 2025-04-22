SELECT
    CITY
FROM
    STATION
WHERE
    SUBSTR(CITY,1,1) in ('A','E','I','O','U');
    