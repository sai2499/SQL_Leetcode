-- Write your PostgreSQL query statement below
WITH basecte AS (
    SELECT DISTINCT post_id, topic_id
    FROM posts
    LEFT OUTER JOIN keywords
    ON POSITION(' ' || LOWER(word) || ' ' IN ' ' || LOWER(content) || ' ') > 0
)
SELECT post_id, 
       COALESCE(
           STRING_AGG(topic_id::TEXT, ',' ORDER BY topic_id), 
           'Ambiguous!'
       ) AS topic
FROM basecte
GROUP BY post_id;