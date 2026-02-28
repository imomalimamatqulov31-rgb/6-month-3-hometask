SELECT
  c.id AS car_id,
  c.car_name,
  cat.category_name
FROM cars c
INNER JOIN categories cat
ON c.category_id = cat.id;


SELECT
  b.id,
  c.car_name,
  c.car_year,
  b.start_date,
  b.total_price
FROM bookings b
INNER JOIN cars c
ON b.car_id = c.id;


SELECT 
u.id AS user_id,
u.firstname,
u.lastname,
b.id AS booking_id,
b.start_date,
b.end_date,
b.total_price,
b.status
FROM users u
INNER JOIN bookings b
ON u.id = b.user_id

SELECT 
u.id AS user_id,
u.firstname,
u.lastname,
c.car_name,
c.car_year,
b.start_date,
b.end_date,
b.total_price,
b.status
FROM users u
INNER JOIN bookings b
ON u.id = b.user_id
INNER JOIN cars c
ON b.car_id = c.id


SELECT 
u.id AS user_id,
u.firstname,
u.lastname,
cat.category_name,
c.car_name,
c.car_year,
b.start_date,
b.end_date,
b.total_price,
b.status
FROM users u
INNER JOIN bookings b
ON u.id = b.user_id
INNER JOIN cars c
ON b.car_id = c.id
INNER JOIN categories cat
ON c.category_id = cat.id


