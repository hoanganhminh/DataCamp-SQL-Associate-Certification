WITH average_rating AS (
  SELECT 
    service_id,
    branch_id,
    ROUND(AVG(rating)::numeric, 2) AS avg_rating
  FROM 
    request
  GROUP BY 
    service_id, branch_id
  HAVING 
    AVG(rating) < 4.5
)

SELECT * FROM average_rating;