SELECT
    u.unique_id,
    e.name
FROM  
    Employees AS e
LEFT OUTER JOIN EmployeeUNI AS u
    ON e.id = u.id;