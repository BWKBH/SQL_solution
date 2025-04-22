SELECT 
    s.hacker_id
    , h.name
FROM
    Submissions s
left JOIN
    Challenges c
on s.challenge_id=c.challenge_id
left JOIN
    Difficulty d
on d.difficulty_level=c.difficulty_level
left JOIN
    Hackers h 
ON
    s.hacker_id = h.hacker_id
WHERE
    s.score = d.score
GROUP BY
    s.hacker_id, h.name
HAVING
    COUNT(s.hacker_id) > 1
ORDER BY
    COUNT(s.hacker_id) DESC
    , s.hacker_id