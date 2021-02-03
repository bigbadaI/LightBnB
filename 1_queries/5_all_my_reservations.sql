SELECT properties.id, properties.title, properties.cost_per_night, reservations.start_date, AVG(property_reviews.rating) AS average_rating
FROM properties
JOIN property_reviews ON properties.id = property_id
JOIN reservations ON reservation_id = reservations.id
JOIN users ON property_reviews.guest_id = users.id
WHERE users.id = 1
AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.start_date
ORDER BY start_date
LIMIT 10;