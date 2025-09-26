-- Write your query for task 2 in this cell
WITH average_time_service AS (
  SELECT 
    service_id,
    branch_id,
    ROUND(AVG(time_taken)::numeric, 2) AS avg_time_taken,
    ROUND(MAX(time_taken)::numeric, 2) AS max_time_taken
  FROM 
    request
  GROUP BY 
    service_id, branch_id
)

SELECT * FROM average_time_service;
