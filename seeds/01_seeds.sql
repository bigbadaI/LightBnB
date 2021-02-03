INSERT INTO users (name, email, password)
VALUES ('Frank', 'frank@gmail.uk', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Alison', 'alison@gmail.uk', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Lily', 'lily@gmail.uk', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('George', 'george@gmail.uk', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Zach', 'zach@gmail.uk', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
VALUES (1, 'Small Cottage', 'description', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 950, 2, 2, 3, 'DC Land', '50th street', 'Gotham', 'AB', 'H0H 0H0'),
(2, 'Queit Get Away', 'description', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 1150, 2, 3, 4, 'DC Land', '55th street', 'Central City', 'AB', 'H0H 0H0'),
(3, 'Paradise In the City', 'description', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 1200, 3, 2, 4, 'DC Land', '88th street', 'Metropolis', 'AB', 'H0H 0H0'),
(2, 'Small Cottage, Big Livin', 'description', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 'https://images.unsplash.com/photo-1604601638406-edc29b54dcf7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1300&q=80', 850, 2, 2, 2, 'DC Land', '50th Ave', 'Star City', 'AB', 'H0H 0H0');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2021-04-04', '2021-04-09', 1, 3),
('2021-06-04', '2021-06-11', 1, 4),
('2021-04-04', '2021-04-09', 4, 1),
('2022-01-04', '2021-01-09', 4, 3),
('2021-02-04', '2021-02-09', 2, 1),
('2021-04-04', '2021-04-09', 3, 2),
('2021-04-20', '2021-05-09', 1, 3),
('2021-12-04', '2021-12-09', 1, 2);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 3, 1, 8, 'message'),
(1, 4, 2, 6, 'message'),
(4, 1, 3, 8, 'message'),
(4, 3, 4, 8, 'message'),
(2, 1, 5, 8, 'message'),
(3, 2, 6, 5, 'message'),
(1, 3, 7, 8, 'message'),
(1, 2, 8, 9, 'message');