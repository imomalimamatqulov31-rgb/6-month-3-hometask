-- Active: 1771920493718@@127.0.0.1@5432@lesson3_sn5
CREATE TYPE gender_type AS ENUM ('male', 'female');

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    hashed_password VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    gender gender_type NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (firstname, lastname, age, email, hashed_password, phone, gender) VALUES
('Sardorbek', 'Sardorov', 17, 'sardorbek@gmail.com', 'sardorbek1212', '+998901234567', 'male'),
('Firdavsbek', 'Zoitov', 18, 'firdavsbek@gmail.com', 'firdavsbek1212', '+998556787879', 'male'),
('Shaxzodbek', 'Shaxzodov', 25, 'shaxzodbek@gmail.com', 'shaxzodbek1212', '+998901233467', 'male');






CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
     category_name VARCHAR(255) NOT NULL,
     description TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO categories (category_name, description) VALUES
('Sedan', 'Compact car with a sedan body shape'),
('Premier', 'Compact car with a hatchback body shape'),
('Chevrolet', 'Sport utility vehicle');


CREATE TYPE gearbox_type AS ENUM ('manual', 'automatic');
CREATE TABLE cars(
    id SERIAL PRIMARY KEY,
    car_name VARCHAR(255) NOT NULL,
    car_year INT NOT NULL,
    car_color VARCHAR(255) NOT NULL,
    car_gearbox gearbox_type NOT NULL,
    price_per_day DECIMAL(10, 2) NOT NULL,
    available_count INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    category_id INT REFERENCES categories(id) ON DELETE CASCADE
)


INSERT INTO cars (car_name, car_year, car_color, car_gearbox, price_per_day, available_count, category_id) VALUES
('Toyota Corolla', 2020, 'Red', 'manual', 100.00, 10, 1),
('Honda Civic', 2019, 'Blue', 'automatic', 80.00, 8, 2),
('Ford Explorer', 2021, 'Black', 'automatic', 150.00, 5, 3);


CREATE TYPE booking_status AS ENUM ('pending', 'active', 'cancelled', 'completed');
CREATE TABLE bookings(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    car_id INT REFERENCES cars(id) ON DELETE CASCADE,
   start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO bookings (user_id, car_id, start_date, end_date, total_price, status) VALUES
(1, 1, '2024-07-01', '2024-07-05', 5000.00, 'active'),
(2, 2, '2024-07-10', '2024-07-15', 4000.00, 'active'),
(3, 3, '2024-07-20', '2024-07-25', 7500.00, 'completed');




