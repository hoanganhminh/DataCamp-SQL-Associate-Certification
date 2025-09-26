WITH datacamp_workspace__user_query AS (
  SELECT 
      id,
      COALESCE(location, 'Unknown') AS location,
      COALESCE(total_rooms, 100) AS total_rooms,
      COALESCE(staff_count, CAST(COALESCE(total_rooms, 100) * 1.5 AS INTEGER)) AS staff_count,
      COALESCE(
          CAST(NULLIF(REGEXP_REPLACE(opening_date, '[^0-9]', '', 'g'), '') AS INTEGER),
          2023
      ) AS opening_date,
      COALESCE(target_guests, 'Leisure') AS target_guests
  FROM 
      branch
  WHERE 
      (total_rooms BETWEEN 1 AND 400 OR total_rooms IS NULL)
      AND (
          CAST(NULLIF(REGEXP_REPLACE(opening_date, '[^0-9]', '', 'g'), '') AS INTEGER) 
          BETWEEN 2000 AND 2023 OR opening_date IS NULL
      )
      AND (location IN ('EMEA', 'NA', 'LATAM', 'APAC') OR location IS NULL)
      AND (target_guests IN ('Leisure', 'Business') OR target_guests IS NULL)
)

SELECT * FROM datacamp_workspace__user_query LIMIT 100;