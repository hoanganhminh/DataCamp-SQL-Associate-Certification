SELECT 
    id,
    COALESCE(location, 'Unknown') AS location,
    CASE 
      WHEN total_rooms BETWEEN 1 AND 400 THEN total_rooms
      ELSE 100 
    END AS total_rooms,
  
    CASE
      WHEN staff_count IS NOT NULL THEN staff_count
      ELSE total_rooms * 1.5 
    END AS staff_count,
  
    CASE
      WHEN opening_date = '-' THEN '2023' WHEN opening_date BETWEEN '2000' AND '2023' THEN opening_date
      ELSE '2023' 
    END AS opening_date,
  
    CASE
      WHEN target_guests IS NULL THEN 'Leisure' WHEN LOWER(target_guests) LIKE 'b%' THEN 'Business'
      ELSE target_guests 
    END AS target_guests
FROM 
    branch;
