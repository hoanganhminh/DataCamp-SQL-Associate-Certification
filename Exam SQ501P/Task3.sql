WITH target_hotels AS (
  SELECT 
    s.description,
    b.id AS branch_id,
    b.location,
    r.id AS request_id,
    r.rating
  FROM 
    request r
    JOIN service s ON r.service_id = s.id
    JOIN branch b ON r.branch_id = b.id
  WHERE 
    s.description IN ('Meal', 'Laundry')
    AND b.location IN ('EMEA', 'LATAM')
)

SELECT * FROM target_hotels;